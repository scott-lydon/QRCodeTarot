//
//  EvolvedWithText.ViewModel.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 6/7/22.
//

import UIKit
import TableMVVM
import CommonExtensions

extension EvolvedWithText {

    struct ViewModel: HasFallBack {
        var labelLeftModel: LabelLabel.ViewModel?
        var labelRightModel: LabelLabel.ViewModel?
        var switchViewModel: TarotSwitchView.ViewModel
        var switchedToLeft: BoolAction?

        var leftText: String? {
            labelLeftModel?.bottomText
        }

        var rightText: String? {
            labelRightModel?.bottomText
        }

        var hideSwitch: Bool {
            leftText.isEmpty || rightText.isEmpty
        }

        var hideLabelLabel: Bool {
            leftText.isEmpty && rightText.isEmpty
        }

        var currentLabelModel: LabelLabel.ViewModel {
            (switchViewModel.isLeft ? labelLeftModel : labelRightModel) ?? .init(topText: "-", bottomText: "-")
        }

        static var fallBack: EvolvedWithText.ViewModel {
            .init(
                labelLeftModel: .init(topText: "-", bottomText: "-"),
                labelRightModel: .init(topText: "-", bottomText: "-"),
                switchViewModel: .init(),
                switchedToLeft: nil
            )
        }
    }
}
