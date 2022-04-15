//
//  ImageLabel.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 4/14/22.
//

import UIKit
import TableMVVM

class ImageLabel: NibView, HasViewModel {

    var viewModel: ViewModel = .fallBack {
        didSet {
            imageView.image = viewModel.image
            label.text = viewModel.text
        }
    }

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var label: UILabel!
}

extension ImageLabel {

    struct ViewModel: HasFallBack {

        let image: UIImage
        let text: String
        static var fallBack: ImageLabel.ViewModel {
            .init(image: .init(), text: "")
        }
    }
}
