//
//  SubMenuChoice.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 5/6/22.
//

import TableMVVM
import UIKit

class SubMenuChoice: NibView, HasViewModel {
    @IBOutlet var title: UILabel!
    @IBOutlet var details: UILabel!
    @IBOutlet var viewToGradient: BottomLeftToTopRightGradient!

    var viewModel: ViewModel = .fallBack {
        didSet {
            self.title.text = viewModel.titleText
            self.details.text = viewModel.detailText
            self.viewToGradient.layer.cornerRadius = 16
            self.viewToGradient.clipsToBounds = true
            self.viewToGradient.layer.borderColor = UIColor.white.cgColor
            self.viewToGradient.layer.borderWidth = 0.2
        }
    }
}

extension SubMenuChoice {
    struct ViewModel: HasFallBack {
        let titleText: String
        let detailText: String

        static var fallBack: Self {
            .init(titleText: "-", detailText: "-")
        }
    }
}
