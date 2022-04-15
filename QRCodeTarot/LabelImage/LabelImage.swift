//
//  LabelImage.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 4/14/22.
//

import UIKit
import TableMVVM

class LabelImage: NibView, HasViewModel {
    typealias ViewModel = ImageLabel.ViewModel

    var viewModel: ImageLabel.ViewModel = .fallBack {
        didSet {
            label.text = viewModel.text
            imageView.image = viewModel.image
        }
    }


    @IBOutlet var label: UILabel!
    @IBOutlet var imageView: UIImageView!
}

