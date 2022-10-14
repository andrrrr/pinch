//
//  Storyboarded.swift
//  pinch
//
//  Created by Andrei on 14/10/2022.
//

import Foundation
import UIKit

protocol Storyboarded {
    static func instantiate(_ name: StoryboardName) -> Self
}

enum StoryboardName: String {
    case Games
}

extension Storyboarded where Self: UIViewController {
    static func instantiate(_ name: StoryboardName) -> Self {
        let fullName = NSStringFromClass(self)
        let className = fullName.components(separatedBy: ".")[1]
        let storyboard = UIStoryboard(name: name.rawValue, bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: className) as! Self
    }
}
