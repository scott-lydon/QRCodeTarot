//
//  SubMenuChoice.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 5/6/22.
//

import UIKit
import TableMVVM

class SubMenuChoice: NibView, HasViewModel {

    @IBOutlet var title: UILabel!
    @IBOutlet var details: UILabel!
    @IBOutlet var viewToGradient: UIView!

    var viewModel: ViewModel = .fallBack {
        didSet {
            self.title.text = viewModel.titleText
            self.details.text = viewModel.detailText
            self.viewToGradient.addGradiant()
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
