//
//  ChoiceView.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 5/3/22.
//

import CommonUIKitExtensions
import TableMVVM
import UIKit

/// Used in the MenuViewController. 
class ChoiceView: NibView, HasViewModel {
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var label: UILabel!
    @IBOutlet var gradientView: UIView!
    @IBOutlet var aspectRatio: NSLayoutConstraint!

    var viewModel: ViewModel = .fallBack {
        didSet {
            imageView.image = viewModel.image
            if let tint = viewModel.tintColor {
                imageView.tintColor = tint
            }
            imageView.roundOrSharpenCorners(constant: viewModel.cornerRadius)
            label.text = viewModel.text
            aspectRatio = aspectRatio.setMultiplier(multiplier: viewModel.ratio)
        }
    }
}
