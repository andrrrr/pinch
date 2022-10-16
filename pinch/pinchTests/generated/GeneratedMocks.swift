import Cuckoo
@testable import pinchApp






 class MockGamesViewModelType: GamesViewModelType, Cuckoo.ProtocolMock {
    
     typealias MocksType = GamesViewModelType
    
     typealias Stubbing = __StubbingProxy_GamesViewModelType
     typealias Verification = __VerificationProxy_GamesViewModelType

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: GamesViewModelType?

     func enableDefaultImplementation(_ stub: GamesViewModelType) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    
    
    
    
     var coordinatorDelegate: GamesViewModelCoordinatorDelegate? {
        get {
            return cuckoo_manager.getter("coordinatorDelegate",
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.coordinatorDelegate)
        }
        
        set {
            cuckoo_manager.setter("coordinatorDelegate",
                value: newValue,
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.coordinatorDelegate = newValue)
        }
        
    }
    
    
    
    
    
     var viewDelegate: GamesViewDelegate? {
        get {
            return cuckoo_manager.getter("viewDelegate",
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.viewDelegate)
        }
        
        set {
            cuckoo_manager.setter("viewDelegate",
                value: newValue,
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.viewDelegate = newValue)
        }
        
    }
    
    
    
    
    
     var rows: [RowViewModel] {
        get {
            return cuckoo_manager.getter("rows",
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.rows)
        }
        
        set {
            cuckoo_manager.setter("rows",
                value: newValue,
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.rows = newValue)
        }
        
    }
    
    
    
    
    
     var games: [Game]? {
        get {
            return cuckoo_manager.getter("games",
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.games)
        }
        
        set {
            cuckoo_manager.setter("games",
                value: newValue,
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.games = newValue)
        }
        
    }
    
    

    

    
    
    
    
     func getGames()  {
        
    return cuckoo_manager.call(
    """
    getGames()
    """,
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.getGames())
        
    }
    
    
    
    
    
     func getGamesLocked()  {
        
    return cuckoo_manager.call(
    """
    getGamesLocked()
    """,
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.getGamesLocked())
        
    }
    
    
    
    
    
     func reloadGames()  {
        
    return cuckoo_manager.call(
    """
    reloadGames()
    """,
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.reloadGames())
        
    }
    
    

     struct __StubbingProxy_GamesViewModelType: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager
    
         init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
        
        var coordinatorDelegate: Cuckoo.ProtocolToBeStubbedOptionalProperty<MockGamesViewModelType, GamesViewModelCoordinatorDelegate> {
            return .init(manager: cuckoo_manager, name: "coordinatorDelegate")
        }
        
        
        
        
        var viewDelegate: Cuckoo.ProtocolToBeStubbedOptionalProperty<MockGamesViewModelType, GamesViewDelegate> {
            return .init(manager: cuckoo_manager, name: "viewDelegate")
        }
        
        
        
        
        var rows: Cuckoo.ProtocolToBeStubbedProperty<MockGamesViewModelType, [RowViewModel]> {
            return .init(manager: cuckoo_manager, name: "rows")
        }
        
        
        
        
        var games: Cuckoo.ProtocolToBeStubbedOptionalProperty<MockGamesViewModelType, [Game]> {
            return .init(manager: cuckoo_manager, name: "games")
        }
        
        
        
        
        
        func getGames() -> Cuckoo.ProtocolStubNoReturnFunction<()> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return .init(stub: cuckoo_manager.createStub(for: MockGamesViewModelType.self, method:
    """
    getGames()
    """, parameterMatchers: matchers))
        }
        
        
        
        
        func getGamesLocked() -> Cuckoo.ProtocolStubNoReturnFunction<()> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return .init(stub: cuckoo_manager.createStub(for: MockGamesViewModelType.self, method:
    """
    getGamesLocked()
    """, parameterMatchers: matchers))
        }
        
        
        
        
        func reloadGames() -> Cuckoo.ProtocolStubNoReturnFunction<()> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return .init(stub: cuckoo_manager.createStub(for: MockGamesViewModelType.self, method:
    """
    reloadGames()
    """, parameterMatchers: matchers))
        }
        
        
    }

     struct __VerificationProxy_GamesViewModelType: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation
    
         init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }
    
        
        
        
        var coordinatorDelegate: Cuckoo.VerifyOptionalProperty<GamesViewModelCoordinatorDelegate> {
            return .init(manager: cuckoo_manager, name: "coordinatorDelegate", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        
        
        
        var viewDelegate: Cuckoo.VerifyOptionalProperty<GamesViewDelegate> {
            return .init(manager: cuckoo_manager, name: "viewDelegate", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        
        
        
        var rows: Cuckoo.VerifyProperty<[RowViewModel]> {
            return .init(manager: cuckoo_manager, name: "rows", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        
        
        
        var games: Cuckoo.VerifyOptionalProperty<[Game]> {
            return .init(manager: cuckoo_manager, name: "games", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        
    
        
        
        
        @discardableResult
        func getGames() -> Cuckoo.__DoNotUse<(), Void> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return cuckoo_manager.verify(
    """
    getGames()
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
        
        
        @discardableResult
        func getGamesLocked() -> Cuckoo.__DoNotUse<(), Void> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return cuckoo_manager.verify(
    """
    getGamesLocked()
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
        
        
        @discardableResult
        func reloadGames() -> Cuckoo.__DoNotUse<(), Void> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return cuckoo_manager.verify(
    """
    reloadGames()
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
    }
}


 class GamesViewModelTypeStub: GamesViewModelType {
    
    
    
    
     var coordinatorDelegate: GamesViewModelCoordinatorDelegate? {
        get {
            return DefaultValueRegistry.defaultValue(for: (GamesViewModelCoordinatorDelegate?).self)
        }
        
        set { }
        
    }
    
    
    
    
    
     var viewDelegate: GamesViewDelegate? {
        get {
            return DefaultValueRegistry.defaultValue(for: (GamesViewDelegate?).self)
        }
        
        set { }
        
    }
    
    
    
    
    
     var rows: [RowViewModel] {
        get {
            return DefaultValueRegistry.defaultValue(for: ([RowViewModel]).self)
        }
        
        set { }
        
    }
    
    
    
    
    
     var games: [Game]? {
        get {
            return DefaultValueRegistry.defaultValue(for: ([Game]?).self)
        }
        
        set { }
        
    }
    
    

    

    
    
    
    
     func getGames()   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
    
    
    
     func getGamesLocked()   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
    
    
    
     func reloadGames()   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
}










 class MockGamesViewModelCoordinatorDelegate: GamesViewModelCoordinatorDelegate, Cuckoo.ProtocolMock {
    
     typealias MocksType = GamesViewModelCoordinatorDelegate
    
     typealias Stubbing = __StubbingProxy_GamesViewModelCoordinatorDelegate
     typealias Verification = __VerificationProxy_GamesViewModelCoordinatorDelegate

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: GamesViewModelCoordinatorDelegate?

     func enableDefaultImplementation(_ stub: GamesViewModelCoordinatorDelegate) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
    
     func showErrorPopup()  {
        
    return cuckoo_manager.call(
    """
    showErrorPopup()
    """,
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.showErrorPopup())
        
    }
    
    
    
    
    
     func showGameDetails(game: Game)  {
        
    return cuckoo_manager.call(
    """
    showGameDetails(game: Game)
    """,
            parameters: (game),
            escapingParameters: (game),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.showGameDetails(game: game))
        
    }
    
    

     struct __StubbingProxy_GamesViewModelCoordinatorDelegate: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager
    
         init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
        
        
        func showErrorPopup() -> Cuckoo.ProtocolStubNoReturnFunction<()> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return .init(stub: cuckoo_manager.createStub(for: MockGamesViewModelCoordinatorDelegate.self, method:
    """
    showErrorPopup()
    """, parameterMatchers: matchers))
        }
        
        
        
        
        func showGameDetails<M1: Cuckoo.Matchable>(game: M1) -> Cuckoo.ProtocolStubNoReturnFunction<(Game)> where M1.MatchedType == Game {
            let matchers: [Cuckoo.ParameterMatcher<(Game)>] = [wrap(matchable: game) { $0 }]
            return .init(stub: cuckoo_manager.createStub(for: MockGamesViewModelCoordinatorDelegate.self, method:
    """
    showGameDetails(game: Game)
    """, parameterMatchers: matchers))
        }
        
        
    }

     struct __VerificationProxy_GamesViewModelCoordinatorDelegate: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation
    
         init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }
    
        
    
        
        
        
        @discardableResult
        func showErrorPopup() -> Cuckoo.__DoNotUse<(), Void> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return cuckoo_manager.verify(
    """
    showErrorPopup()
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
        
        
        @discardableResult
        func showGameDetails<M1: Cuckoo.Matchable>(game: M1) -> Cuckoo.__DoNotUse<(Game), Void> where M1.MatchedType == Game {
            let matchers: [Cuckoo.ParameterMatcher<(Game)>] = [wrap(matchable: game) { $0 }]
            return cuckoo_manager.verify(
    """
    showGameDetails(game: Game)
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
    }
}


 class GamesViewModelCoordinatorDelegateStub: GamesViewModelCoordinatorDelegate {
    

    

    
    
    
    
     func showErrorPopup()   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
    
    
    
     func showGameDetails(game: Game)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
}










 class MockGamesViewDelegate: GamesViewDelegate, Cuckoo.ProtocolMock {
    
     typealias MocksType = GamesViewDelegate
    
     typealias Stubbing = __StubbingProxy_GamesViewDelegate
     typealias Verification = __VerificationProxy_GamesViewDelegate

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: GamesViewDelegate?

     func enableDefaultImplementation(_ stub: GamesViewDelegate) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
    
     func refreshTable()  {
        
    return cuckoo_manager.call(
    """
    refreshTable()
    """,
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.refreshTable())
        
    }
    
    

     struct __StubbingProxy_GamesViewDelegate: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager
    
         init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
        
        
        func refreshTable() -> Cuckoo.ProtocolStubNoReturnFunction<()> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return .init(stub: cuckoo_manager.createStub(for: MockGamesViewDelegate.self, method:
    """
    refreshTable()
    """, parameterMatchers: matchers))
        }
        
        
    }

     struct __VerificationProxy_GamesViewDelegate: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation
    
         init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }
    
        
    
        
        
        
        @discardableResult
        func refreshTable() -> Cuckoo.__DoNotUse<(), Void> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return cuckoo_manager.verify(
    """
    refreshTable()
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
    }
}


 class GamesViewDelegateStub: GamesViewDelegate {
    

    

    
    
    
    
     func refreshTable()   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
}





import Cuckoo
@testable import pinchApp

import Foundation






 class MockEndPointServiceType: EndPointServiceType, Cuckoo.ProtocolMock {
    
     typealias MocksType = EndPointServiceType
    
     typealias Stubbing = __StubbingProxy_EndPointServiceType
     typealias Verification = __VerificationProxy_EndPointServiceType

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: EndPointServiceType?

     func enableDefaultImplementation(_ stub: EndPointServiceType) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
    
     func getGames(body: String, errorDelegate: EasyRequestDelegate?, response responseCallback: @escaping GetGamesCompletionHandler)  {
        
    return cuckoo_manager.call(
    """
    getGames(body: String, errorDelegate: EasyRequestDelegate?, response: @escaping GetGamesCompletionHandler)
    """,
            parameters: (body, errorDelegate, responseCallback),
            escapingParameters: (body, errorDelegate, responseCallback),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.getGames(body: body, errorDelegate: errorDelegate, response: responseCallback))
        
    }
    
    
    
    
    
     func getCovers(body: String, errorDelegate: EasyRequestDelegate?, response responseCallback: @escaping GetCoversCompletionHandler)  {
        
    return cuckoo_manager.call(
    """
    getCovers(body: String, errorDelegate: EasyRequestDelegate?, response: @escaping GetCoversCompletionHandler)
    """,
            parameters: (body, errorDelegate, responseCallback),
            escapingParameters: (body, errorDelegate, responseCallback),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.getCovers(body: body, errorDelegate: errorDelegate, response: responseCallback))
        
    }
    
    

     struct __StubbingProxy_EndPointServiceType: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager
    
         init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
        
        
        func getGames<M1: Cuckoo.Matchable, M2: Cuckoo.OptionalMatchable, M3: Cuckoo.Matchable>(body: M1, errorDelegate: M2, response responseCallback: M3) -> Cuckoo.ProtocolStubNoReturnFunction<(String, EasyRequestDelegate?, GetGamesCompletionHandler)> where M1.MatchedType == String, M2.OptionalMatchedType == EasyRequestDelegate, M3.MatchedType == GetGamesCompletionHandler {
            let matchers: [Cuckoo.ParameterMatcher<(String, EasyRequestDelegate?, GetGamesCompletionHandler)>] = [wrap(matchable: body) { $0.0 }, wrap(matchable: errorDelegate) { $0.1 }, wrap(matchable: responseCallback) { $0.2 }]
            return .init(stub: cuckoo_manager.createStub(for: MockEndPointServiceType.self, method:
    """
    getGames(body: String, errorDelegate: EasyRequestDelegate?, response: @escaping GetGamesCompletionHandler)
    """, parameterMatchers: matchers))
        }
        
        
        
        
        func getCovers<M1: Cuckoo.Matchable, M2: Cuckoo.OptionalMatchable, M3: Cuckoo.Matchable>(body: M1, errorDelegate: M2, response responseCallback: M3) -> Cuckoo.ProtocolStubNoReturnFunction<(String, EasyRequestDelegate?, GetCoversCompletionHandler)> where M1.MatchedType == String, M2.OptionalMatchedType == EasyRequestDelegate, M3.MatchedType == GetCoversCompletionHandler {
            let matchers: [Cuckoo.ParameterMatcher<(String, EasyRequestDelegate?, GetCoversCompletionHandler)>] = [wrap(matchable: body) { $0.0 }, wrap(matchable: errorDelegate) { $0.1 }, wrap(matchable: responseCallback) { $0.2 }]
            return .init(stub: cuckoo_manager.createStub(for: MockEndPointServiceType.self, method:
    """
    getCovers(body: String, errorDelegate: EasyRequestDelegate?, response: @escaping GetCoversCompletionHandler)
    """, parameterMatchers: matchers))
        }
        
        
    }

     struct __VerificationProxy_EndPointServiceType: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation
    
         init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }
    
        
    
        
        
        
        @discardableResult
        func getGames<M1: Cuckoo.Matchable, M2: Cuckoo.OptionalMatchable, M3: Cuckoo.Matchable>(body: M1, errorDelegate: M2, response responseCallback: M3) -> Cuckoo.__DoNotUse<(String, EasyRequestDelegate?, GetGamesCompletionHandler), Void> where M1.MatchedType == String, M2.OptionalMatchedType == EasyRequestDelegate, M3.MatchedType == GetGamesCompletionHandler {
            let matchers: [Cuckoo.ParameterMatcher<(String, EasyRequestDelegate?, GetGamesCompletionHandler)>] = [wrap(matchable: body) { $0.0 }, wrap(matchable: errorDelegate) { $0.1 }, wrap(matchable: responseCallback) { $0.2 }]
            return cuckoo_manager.verify(
    """
    getGames(body: String, errorDelegate: EasyRequestDelegate?, response: @escaping GetGamesCompletionHandler)
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
        
        
        @discardableResult
        func getCovers<M1: Cuckoo.Matchable, M2: Cuckoo.OptionalMatchable, M3: Cuckoo.Matchable>(body: M1, errorDelegate: M2, response responseCallback: M3) -> Cuckoo.__DoNotUse<(String, EasyRequestDelegate?, GetCoversCompletionHandler), Void> where M1.MatchedType == String, M2.OptionalMatchedType == EasyRequestDelegate, M3.MatchedType == GetCoversCompletionHandler {
            let matchers: [Cuckoo.ParameterMatcher<(String, EasyRequestDelegate?, GetCoversCompletionHandler)>] = [wrap(matchable: body) { $0.0 }, wrap(matchable: errorDelegate) { $0.1 }, wrap(matchable: responseCallback) { $0.2 }]
            return cuckoo_manager.verify(
    """
    getCovers(body: String, errorDelegate: EasyRequestDelegate?, response: @escaping GetCoversCompletionHandler)
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
    }
}


 class EndPointServiceTypeStub: EndPointServiceType {
    

    

    
    
    
    
     func getGames(body: String, errorDelegate: EasyRequestDelegate?, response responseCallback: @escaping GetGamesCompletionHandler)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
    
    
    
     func getCovers(body: String, errorDelegate: EasyRequestDelegate?, response responseCallback: @escaping GetCoversCompletionHandler)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
}





import Cuckoo
@testable import pinchApp

import UIKit






 class MockImageServiceType: ImageServiceType, Cuckoo.ProtocolMock {
    
     typealias MocksType = ImageServiceType
    
     typealias Stubbing = __StubbingProxy_ImageServiceType
     typealias Verification = __VerificationProxy_ImageServiceType

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: ImageServiceType?

     func enableDefaultImplementation(_ stub: ImageServiceType) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
    
     func getImageData(url: String) -> Data? {
        
    return cuckoo_manager.call(
    """
    getImageData(url: String) -> Data?
    """,
            parameters: (url),
            escapingParameters: (url),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.getImageData(url: url))
        
    }
    
    
    
    
    
     func downloadImage(imageUrl: String, successClosure: @escaping (Data?) -> Void)  {
        
    return cuckoo_manager.call(
    """
    downloadImage(imageUrl: String, successClosure: @escaping (Data?) -> Void)
    """,
            parameters: (imageUrl, successClosure),
            escapingParameters: (imageUrl, successClosure),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.downloadImage(imageUrl: imageUrl, successClosure: successClosure))
        
    }
    
    

     struct __StubbingProxy_ImageServiceType: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager
    
         init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
        
        
        func getImageData<M1: Cuckoo.Matchable>(url: M1) -> Cuckoo.ProtocolStubFunction<(String), Data?> where M1.MatchedType == String {
            let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: url) { $0 }]
            return .init(stub: cuckoo_manager.createStub(for: MockImageServiceType.self, method:
    """
    getImageData(url: String) -> Data?
    """, parameterMatchers: matchers))
        }
        
        
        
        
        func downloadImage<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(imageUrl: M1, successClosure: M2) -> Cuckoo.ProtocolStubNoReturnFunction<(String, (Data?) -> Void)> where M1.MatchedType == String, M2.MatchedType == (Data?) -> Void {
            let matchers: [Cuckoo.ParameterMatcher<(String, (Data?) -> Void)>] = [wrap(matchable: imageUrl) { $0.0 }, wrap(matchable: successClosure) { $0.1 }]
            return .init(stub: cuckoo_manager.createStub(for: MockImageServiceType.self, method:
    """
    downloadImage(imageUrl: String, successClosure: @escaping (Data?) -> Void)
    """, parameterMatchers: matchers))
        }
        
        
    }

     struct __VerificationProxy_ImageServiceType: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation
    
         init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }
    
        
    
        
        
        
        @discardableResult
        func getImageData<M1: Cuckoo.Matchable>(url: M1) -> Cuckoo.__DoNotUse<(String), Data?> where M1.MatchedType == String {
            let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: url) { $0 }]
            return cuckoo_manager.verify(
    """
    getImageData(url: String) -> Data?
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
        
        
        @discardableResult
        func downloadImage<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(imageUrl: M1, successClosure: M2) -> Cuckoo.__DoNotUse<(String, (Data?) -> Void), Void> where M1.MatchedType == String, M2.MatchedType == (Data?) -> Void {
            let matchers: [Cuckoo.ParameterMatcher<(String, (Data?) -> Void)>] = [wrap(matchable: imageUrl) { $0.0 }, wrap(matchable: successClosure) { $0.1 }]
            return cuckoo_manager.verify(
    """
    downloadImage(imageUrl: String, successClosure: @escaping (Data?) -> Void)
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
    }
}


 class ImageServiceTypeStub: ImageServiceType {
    

    

    
    
    
    
     func getImageData(url: String) -> Data?  {
        return DefaultValueRegistry.defaultValue(for: (Data?).self)
    }
    
    
    
    
    
     func downloadImage(imageUrl: String, successClosure: @escaping (Data?) -> Void)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
}




