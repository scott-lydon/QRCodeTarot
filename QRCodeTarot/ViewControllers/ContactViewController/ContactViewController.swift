//
//  ContactViewController.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 4/15/22.
//

import UIKit

/// TODO: Remodel. 
class ContactViewController: UIViewController {
    static func instantiate() -> ContactViewController {
        let viewController: ContactViewController = UIStoryboard.vc()!
        viewController.loadView()
        return viewController
    }
}
