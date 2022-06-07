//
//  ChoiceView.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 5/3/22.
//

import UIKit
import TableMVVM
import CommonUIKitExtensions

/// Used in the MenuViewController. 
class ChoiceView: NibView, HasViewModel {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var label: UILabel!
    @IBOutlet var gradientView: UIView!
    @IBOutlet var aspectRatio: NSLayoutConstraint!

    var viewModel: ViewModel = .fallBack {
        didSet {
            self.imageView.image = viewModel.image
            self.imageView.roundOrSharpenCorners(constant: viewModel.cornerRadius)
            self.label.text = viewModel.text
            aspectRatio = aspectRatio.setMultiplier(multiplier: viewModel.ratio)
        }
    }
}
