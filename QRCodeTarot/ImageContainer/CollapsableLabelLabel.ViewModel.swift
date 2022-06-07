//
//  CollapsableLabelLabel.ViewModel.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 5/17/22.
//

import Foundation
import TableMVVM

extension CollapsableLabelLabel {

    struct ViewModel: HasFallBack {
        var labelLabelViewModel: LabelLabel.ViewModel
        var buttonText: String = "Read More"
        var buttonIsHidden: Bool = false
        var buttonTapped: Action? {
            didSet {
                print("action changed.")
            }
        }

        init(
            labelLabelViewModel: LabelLabel.ViewModel,
            buttonText: String = "Read More",
            buttonIsHidden: Bool = false,
            buttonTapped: Action? = nil
        ) {
            self.labelLabelViewModel = labelLabelViewModel
            self.buttonText = buttonText
            self.buttonIsHidden = buttonIsHidden
            self.buttonTapped = buttonTapped
        }
//
//        init(
//            topText: String,
//            bottomText: String,
//            startLineCount: Int = 4,
//            buttonText: String = "Read More"
//        ) {
//            self.labelLabelViewModel = .init(topText: topText, bottomText: bottomText, lineCount: startLineCount)
//            self.buttonText = buttonText
//            buttonIsHidden = false
//        }

        static var fallBack: CollapsableLabelLabel.ViewModel {
            .init(labelLabelViewModel: .init(topText: "-", bottomText: "-"))
        }
    }
}
