//
//  LabelLabel.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 4/14/22.
//

import UIKit
import TableMVVM

/// Used 
class LabelLabel: NibView, HasViewModel {

    @IBOutlet var topLabel: UILabel! {
        didSet {
            topLabel.setDynamicText()
        }
    }
    @IBOutlet var bottomLabel: UILabel! {
        didSet {
            bottomLabel.setDynamicText()
        }
    }

    var viewModel: ViewModel = .fallBack {
        didSet {
            topLabel.text = viewModel.topText
            bottomLabel.text = viewModel.bottomText
            bottomLabel.numberOfLines = viewModel.lineCount
        }
    }
}

extension LabelLabel {
    struct ViewModel: HasFallBack {
        let topText: String
        let bottomText: String
        var lineCount: Int = 0
        static var fallBack: Self {
            .init(topText: "", bottomText: "")
        }
    }
}
