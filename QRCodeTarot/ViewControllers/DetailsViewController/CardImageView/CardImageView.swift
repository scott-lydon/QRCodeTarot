//
//  CardImageView.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 5/10/22.
//

import UIKit
import TableMVVM

/// Might be used for the Card Details.
/// The constraints were throwing errors in interface builder because it is expected
/// that the height be defined by its width.  And so the superview won't define the height.
/// This is solved by lowering the height's priority from 1000 to 999.
class CardImageView: NibView, HasViewModel {

    @IBOutlet var imageView: UIImageView!
    typealias ViewModel = UIImage

    var viewModel: UIImage = .cardDemo {
        didSet {
            imageView.image = viewModel
            imageView.roundCorners(constant: 12)
            imageView.contentMode = .scaleAspectFill
        }
    }
}


extension UIImage: HasFallBack {
    public static var fallBack: Self {
        .init()
    }
}
