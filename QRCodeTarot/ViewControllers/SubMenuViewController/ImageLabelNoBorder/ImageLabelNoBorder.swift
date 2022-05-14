//
//  ImageLabelNoBorder.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 5/9/22.
//

import UIKit
import TableMVVM

class ImageLabelNoBorder: NibView, HasViewModel {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var label: UILabel!

    var viewModel: ImageLabel.ViewModel = .fallBack {
        didSet {
            imageView.image = viewModel.image
            label.text = viewModel.text
        }
    }
}
