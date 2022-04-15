//
//  UIStoryboard.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 4/14/22.
//

import UIKit

extension UIStoryboard {

    /// Assumes storyboard name and the viewcontroller identifier match the view controller's class name.
    static func vc<T: UIViewController>() -> T? {
        UIStoryboard(name: T.className, bundle: .main)
            .instantiateViewController(withIdentifier: T.className) as? T
    }
}
