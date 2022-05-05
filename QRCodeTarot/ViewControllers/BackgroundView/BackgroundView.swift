//
//  BackgroundView.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 5/3/22.
//

import UIKit
import TableMVVM

class BackgroundView: NibView, HasViewModel {

    @IBOutlet var backgroundColorShade: UIImageView!

    var viewModel: UIImage = UIImage.brightColorShade {
        didSet {
            backgroundColorShade.image = viewModel
        }
    }
}
