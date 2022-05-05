//
//  ChoiceView.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 5/3/22.
//

import Foundation
import UIKit

class ChoiceView: NibView {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var label: UILabel!
    @IBOutlet var gradientView: UIView!

    var viewModel: ViewModel = .fallBack {
        didSet {
            self.imageView.image = viewModel.image
            self.label.text = viewModel.text

         //   let layer0: CAGradientLayer = .subtleDarkGradientLayer
          //  layer0.bounds = gradientView.bounds.insetForGradient
          //  layer0.position = gradientView.center
          //  gradientView.layer.addSublayer(layer0)
            gradientView.layer.cornerRadius = 16
            gradientView.layer.borderWidth = 1
            gradientView.layer.borderColor = UIColor.offWhiteGray.cgColor
        }
    }
}
