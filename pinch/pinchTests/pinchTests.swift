//
//  pinchTests.swift
//  pinchTests
//
//  Created by Andrei on 16/10/2022.
//

import Nimble
import Quick
import Nimble_Snapshots
import Cuckoo

@testable import pinchApp

class GamesViewControllerUITests: QuickSpec {

    private var snapshots: NimbleSnapshotHelper!
    var gamesViewController: GamesViewController!
    var window: UIWindow!

    override func spec() {
        var endPointServiceMock: MockEndPointServiceType!
        var imageServiceMock: MockImageServiceType!

        beforeEach {
            endPointServiceMock = MockEndPointServiceType()
            imageServiceMock = MockImageServiceType()

            DependencyHelper()
                .register(type: EndPointServiceType.self,
                          item: endPointServiceMock)
                .registerAsDefaultResolver()

            stub(endPointServiceMock) { mock in
                when(mock.getGames(body: any(),
                                   errorDelegate: any(),
                                   response: any())).then { (_, _, callback) in
                    guard let games = self.getMockGames() else {
                        fail("can't get mock data")
                        return
                    }
                    callback(games)
                }
            }

            stub(imageServiceMock) { mock in
                let image = UIImage(named: "Controller_icon")
                guard let imageData = image?.pngData() else {
                    fail("fails to get image data")
                    return
                }
                when(mock.getImageData(url: any())).thenReturn(imageData)

            }
            
            self.gamesViewController = GamesViewController.instantiate(StoryboardName.Games)
            self.gamesViewController.viewModel = GamesViewModel()
            self.snapshots = NimbleSnapshotHelper(parentView: self.gamesViewController.view)
        }

        context("GamesViewController") {
            describe("appearance") {
                it("light mode") {

                    expect(self.gamesViewController.view)
                        .to(self.snapshots.lookGood(mode: .light, tolerance: 0.1))
                }
                it("dark mode") {
                    expect(self.gamesViewController.view)
                        .to(self.snapshots.lookGood(mode: .dark, tolerance: 0.1))
                }
            }
        }

        afterEach {
            DependencyHelper.resetDefaultResolver()
        }
    }

    private func getMockGames() -> [Game]? {
        let decoder = JSONDecoder()

        if let data = JsonTestingHelper.getDataFromLocalResource(resource: "testData") {
            do {
                let interpretDataModel = try decoder.decode([Game].self, from: data)
                return interpretDataModel
            } catch {
                print("Error while decodning JSON: \(error)")
                return nil
            }
        } else {
            return nil
        }
    }
}
