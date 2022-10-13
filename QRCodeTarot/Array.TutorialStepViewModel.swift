//
//  Array.TutorialStepViewModel.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 5/18/22.
//

import Foundation

extension Array where Element == TutorialStepView.ViewModel {

    var correctlyNumbered: Self {
        enumerated().map { .init(image: $1.image, count: $0 + 1, stepDescription: $1.stepDescription) }
    }
}
