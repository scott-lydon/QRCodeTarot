//
//  ImageContainer.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 4/14/22.
//

import UIKit
import TableMVVM

class ImageContainer: NibView, HasViewModel {

    var viewModel: UIImage = .init() {
        didSet {
            imageView.image = viewModel
        }
    }

    typealias ViewModel = UIImage

    @IBOutlet var imageView: UIImageView!
}
