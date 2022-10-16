//
//  NimbleSnapshotHelper.swift
//  ocktoappUITests
//
//  Created by Andrei on 25/02/2021.
//

import Foundation
import Nimble
import Nimble_Snapshots


enum SnapshotAction {
    case recordSnapshot
    case verifySnapshot
}

let snapshotAction: SnapshotAction = .verifySnapshot

class NimbleSnapshotHelper {
    let parentView: UIView

    required init(parentView: UIView) {
        self.parentView = parentView
    }

    fileprivate func getSizes() -> [String: CGSize] {
        return ["iPhones 14ProMax":                     CGSize(width: 430, height: 932),
                "iPhones 14Pro":                        CGSize(width: 393, height: 852),
                "iPhones 13":                           CGSize(width: 390, height: 844),
                "iPhones 13ProMax":                     CGSize(width: 490, height: 780),
                "iPhones 12Mini":                       CGSize(width: 360, height: 780),
                "iPhones 12ProMax,13ProMax,14Plus":     CGSize(width: 428, height: 926),
                "iPhones 12,12Pro,13":                  CGSize(width: 390, height: 844),
                "iPhones Xs Max,Xr,11,11,ProMax":       CGSize(width: 414, height: 896),
                "iPhones X,Xs,11Pro,13Mini,SE3":        CGSize(width: 375, height: 812),
                "iPhones 6,6s,7,8Plus":                 CGSize(width: 414, height: 736),
                "iPhones 6,6s,7,8":                     CGSize(width: 375, height: 667)
        ]
    }

    public func lookGood(named name: String? = nil,
                         mode: UIUserInterfaceStyle? = nil,
                         testWithKeyboard: Bool = false,
                         tolerance: CGFloat = 0.05) -> Predicate<Snapshotable> {
        //https://ios-resolution.com/
        class KeyboardSize {
            static let iPhone5_6_7_8: CGFloat = 216
            static let iPhone6_7_8_Plus: CGFloat = 226
            static let iPhoneX_Xs: CGFloat = 257
            static let iPhoneXSMax_Xr: CGFloat = 267
        }

        var sizes = getSizes()

        if testWithKeyboard {
            sizes["iPhones 5,5s,5c,SE with keyboard"] =     CGSize(width: 320, height: 568 - KeyboardSize.iPhone5_6_7_8)
            sizes["iPhones 6,6s,7,8 with keyboard"] =       CGSize(width: 375, height: 667 - KeyboardSize.iPhone5_6_7_8)
            sizes["iPhone6_7_8_Plus with keyboard"] =       CGSize(width: 414, height: 736 - KeyboardSize.iPhone6_7_8_Plus)
            sizes["iPhones_X__Xs_11_Pro_with_keyboard"] =   CGSize(width: 375, height: 812 - KeyboardSize.iPhoneX_Xs)
            sizes["iPhones_Xs_Max__Xr_11_11_Pro_Max_with_keyboard"] =
                                                            CGSize(width: 414, height: 896 - KeyboardSize.iPhoneXSMax_Xr)
            sizes["iPhones_12__12_Pro_with_keyboard"] =     CGSize(width: 390, height: 844 - KeyboardSize.iPhoneXSMax_Xr)
            sizes["iPhones_12_Pro_Max_with_keyboard"] =     CGSize(width: 428, height: 926 - KeyboardSize.iPhoneXSMax_Xr)
            sizes["iPhones_12_Mini_with_keyboard"] =        CGSize(width: 360, height: 780 - KeyboardSize.iPhoneXSMax_Xr)
        }

        let resizeMode = ResizeMode.block(resizeBlock: { (view, size) in
            self.parentView.frame.size = size
            if let mode = mode {
                self.parentView.overrideUserInterfaceStyle = mode
                (view.superview ?? view).overrideUserInterfaceStyle = mode
            }

            (view.superview ?? view).setNeedsLayout()
            (view.superview ?? view).layoutIfNeeded()
        })

        switch snapshotAction {
        case .recordSnapshot:
            return recordDynamicSizeSnapshot(named: name,
                                             identifier: nil,
                                             sizes: sizes,
                                             isDeviceAgnostic: false,
                                             usesDrawRect: false,
                                             resizeMode: resizeMode)

        case .verifySnapshot:
            return haveValidDynamicSizeSnapshot(named: name,
                                                identifier: nil,
                                                sizes: sizes,
                                                isDeviceAgnostic: false,
                                                usesDrawRect: false,
                                                tolerance: tolerance,
                                                resizeMode: resizeMode)
        }
    }
}
