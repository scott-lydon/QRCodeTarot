//
//  CollapsableLabelLabel.ViewModel.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 5/17/22.
//

import Foundation
import TableMVVM
import CommonExtensions

extension CollapsableLabelLabel {

    struct ViewModel: HasFallBack {
        var labelLabelViewModel: LabelLabel.ViewModel
        var buttonText: String = "Read More"

        var buttonIsHidden: Bool = false
        var buttonTapped: Action? 

        init(
            topText: String = "Description",
            bottomText: String,
            buttonText: String = "Read More",
            lineCutoff: Int = 4,
            actualLineCount: Int
        ) {
            self.init(
                topText: topText,
                bottomText: bottomText,
                lineCount: actualLineCount > lineCutoff ? lineCutoff : 0,
                buttonText: buttonText,
                buttonIsHidden: actualLineCount < (lineCutoff + 1)
            )
        }

        init(
            topText: String,
            bottomText: String,
            lineCount: Int = 5,
            buttonText: String = "Read More",
            buttonIsHidden: Bool = false
        ) {
            self.labelLabelViewModel = .init(
                topText: topText,
                bottomText: bottomText,
                lineCount: lineCount
            )
            self.buttonText = buttonText
            self.buttonIsHidden = buttonIsHidden
        }

        static var fallBack: CollapsableLabelLabel.ViewModel {
            .init(topText: "-", bottomText: "-")
        }
    }
}
