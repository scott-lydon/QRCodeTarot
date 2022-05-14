//
//  CardImageView.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 5/10/22.
//

import UIKit
import TableMVVM

class CardImageView: NibView, HasViewModel {

    @IBOutlet var imageView: UIImageView!
    typealias ViewModel = UIImage

    var viewModel: UIImage = .cardDemo {
        didSet {
            imageView.image = viewModel
        }
    }
}
