//
//  ContactViewController.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 4/15/22.
//

import UIKit

/// TODO: Remodel. 
class ContactViewController: UIViewController {

    @IBOutlet var simpleText: SimpleTextCell!

    static func instantiate() -> ContactViewController {
        let viewController: ContactViewController = UIStoryboard.vc()!
        viewController.loadView()
        viewController.simpleText.viewModel = "contact at..."
        return viewController
    }
}
