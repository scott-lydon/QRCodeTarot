//
//  EvolvedWithText.ViewModel.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 6/7/22.
//

import UIKit
import TableMVVM

extension EvolvedWithText {

    struct ViewModel: HasFallBack {
        var labelLeftModel: LabelLabel.ViewModel?
        var labelRightModel: LabelLabel.ViewModel?
        var switchViewModel: TarotSwitchView.ViewModel
        var switchedToLeft: BoolAction?

        var hideSwitch: Bool {
            labelLeftModel == nil || labelRightModel == nil
        }

        var hideLabelLabel: Bool {
            labelLeftModel == nil && labelRightModel == nil
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
