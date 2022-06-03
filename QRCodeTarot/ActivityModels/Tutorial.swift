//
//  Tutorial.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 5/12/22.
//

import UIKit

typealias Tutorial = [TutorialItem.Step]

struct TutorialItem {
    struct Step {

        var image: UIImage?
        var title: String?
        var description: String

        var viewModel: TutorialStepView.ViewModel {
            .init(
                image: image,
                count: nil,
                stepDescription: LabelLabel.ViewModel(
                    topText: title,
                    bottomText: description
                )
            )
        }
    }
}
