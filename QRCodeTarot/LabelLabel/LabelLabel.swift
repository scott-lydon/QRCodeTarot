//
//  LabelLabel.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 4/14/22.
//

import UIKit
import TableMVVM

class LabelLabel: NibView, HasViewModel {

    var viewModel: ViewModel = .fallBack {
        didSet {
            topLabel.text = viewModel.topText
            bottomLabel.text = viewModel.bottomText
        }
    }

    @IBOutlet var topLabel: UILabel!
    @IBOutlet var bottomLabel: UILabel!
}

extension LabelLabel {
    struct ViewModel: HasFallBack {
        let topText: String
        let bottomText: String
        static var fallBack: Self {
            .init(topText: "", bottomText: "")
        }
    }
}
