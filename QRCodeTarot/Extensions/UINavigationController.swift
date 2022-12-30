//
//  UINavigationController.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 4/15/22.
//

import UIKit

extension UINavigationController {
    func popToFirstOf<T: UIViewController>(type: T = .init()) {
        guard let t: T = viewControllers.firstOfType() else { return }
        print(String(describing: t))
        var last: UIViewController? = viewControllers.last
        while last as? T == nil {
            popViewController(animated: true)
            last = viewControllers.last
        }
    }
}
