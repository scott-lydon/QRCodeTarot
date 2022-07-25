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
            topLabel.isHidden = viewModel.topText == nil
            
            bottomLabel.isHidden = viewModel.bottomText == nil
            let attributedString = NSMutableAttributedString(string: viewModel.bottomText ?? "")
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.minimumLineHeight = viewModel.lineHeight
            paragraphStyle.maximumLineHeight = viewModel.lineHeight
            attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))
            bottomLabel.attributedText = attributedString
            bottomLabel.numberOfLines = viewModel.lineCount
        }
    }
}

extension LabelLabel {
    struct ViewModel: HasFallBack {
        let topText: String?
        let bottomText: String?
        var lineCount: Int = 0
        var lineHeight: CGFloat = 24
        static var fallBack: Self {
            .init(topText: "", bottomText: "")
        }
    }
}
