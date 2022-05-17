//
//  SubMenuChoice.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 5/6/22.
//

import UIKit
import TableMVVM

/// Used in SubMenuViewController
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

        init(titleText: String, detailText: String) {
            self.titleText = titleText
            self.detailText = detailText
        }

        init(_ game: Game) {
            self.init(titleText: game.title, detailText: game.subTitle)
        }

        init(_ trick: MagicTrick) {
            self.init(titleText: trick.title, detailText: trick.subTitle)
        }

        static var fallBack: Self {
            .init(titleText: "-", detailText: "-")
        }
    }
}
