//
//  BackgroundView.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 5/3/22.
//

import TableMVVM
import UIKit

/// Used for all the ViewControllers. 
class BackgroundView: NibView, HasViewModel {
    @IBOutlet var backgroundColorShade: UIImageView!

    var viewModel: UIImage = .brightColorShade {
        didSet {
            backgroundColorShade.image = viewModel
        }
    }

    var darkShade: Self {
        viewModel = .darkColorShade
        return self
    }
}
