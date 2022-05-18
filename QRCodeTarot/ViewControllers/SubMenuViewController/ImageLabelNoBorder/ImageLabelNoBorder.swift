//
//  ImageLabelNoBorder.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 5/9/22.
//

import UIKit
import TableMVVM

/// Used in SubMenuViewcontroller
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


struct ImageLabel {

    struct ViewModel: HasFallBack {

        let image: UIImage
        let text: String

        static var fallBack: ImageLabel.ViewModel {
            .init(image: .init(), text: "")
        }
    }
}
