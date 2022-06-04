//
//  CollapsableLabelLabel.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 5/10/22.
//

import UIKit
import TableMVVM
import CommonExtensions
import CommonUIKitExtensions

class CollapsableLabelLabel: NibView, HasViewModel {

    @IBOutlet var labelLabel: LabelLabel!
    @IBOutlet var button: UIButton!

    @IBAction func buttonTapped(_ sender: Any) {
        var buffer = viewModel
        buffer.buttonIsHidden = true
        buffer.labelLabelViewModel.lineCount = 0
        // invalidateIntrinsicContentSize() <- no effect here.
        viewModel = buffer
        viewModel.buttonTapped?()
    }

    var viewModel: ViewModel = .fallBack {
        didSet {
            labelLabel.viewModel = viewModel.labelLabelViewModel
            labelLabel.bottomLabel.setContentCompressionResistancePriority(.required, for: .vertical)
            labelLabel.bottomLabel.setContentHuggingPriority(.required, for: .vertical)

            button.setTitle(viewModel.buttonText, for: .normal)
            button.layer.cornerRadius = 12
            button.layer.masksToBounds = true
            button.layer.borderColor = UIColor.darkBorder.cgColor
            button.setTitleColor(.white, for: .normal)

            let imageAttachment = NSTextAttachment()
            imageAttachment.image = UIImage.chevronRight.withTintColor(.white)
            let fullString = NSMutableAttributedString(string: viewModel.buttonText + " ")
            fullString.append(NSAttributedString(attachment: imageAttachment))
            fullString.set(color: .white)
            button.setAttributedTitle(fullString, for: .normal)
            button.isHidden = viewModel.buttonIsHidden
        }
    }
}
