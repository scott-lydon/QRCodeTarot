//
//  EvolvedWithText.ViewModel.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 6/7/22.
//

import UIKit

extension EvolvedWithText {
    struct ViewModel: HasFallBack {
        var labelLeftModel: UILabel.ViewModel?
        var labelRightModel: UILabel.ViewModel?
        var switchViewModel: TarotSwitchView.ViewModel
        var switchedToLeft: BoolAction?

        var hideSwitch: Bool {
            labelLeftModel == nil || labelRightModel == nil
        }

        var title: String {
            currentLabelModel.text
        }

        var titleViewModel: UILabel.ViewModel {
            .init(text: title, color: .white, font: .inter(size: 15), alignment: .left)
        }

        var hideTitle: Bool {
            (labelLeftModel == nil) == (labelRightModel == nil)
        }

        var hideLabel: Bool {
            labelLeftModel == nil && labelRightModel == nil
        }


        var currentLabelModel: UILabel.ViewModel {
            (switchViewModel.isLeft ? labelLeftModel : labelRightModel) ?? .init()
        }

        static var fallBack: EvolvedWithText.ViewModel {
            .init(labelLeftModel: .init(), labelRightModel: .init(), switchViewModel: .init())
        }
    }
}
