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
        var buttonIsHidden = false
        var buttonTapped: Action?

        static var fallBack: CollapsableLabelLabel.ViewModel {
            .init(labelLabelViewModel: .init(topText: "-", bottomText: "-"))
        }
    }
}
