//
//  MagicTrick.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 5/12/22.
//

import Foundation

struct MagicTrick: CanDisplayTutorial {
    var title: String
    var subTitle: String
    var summary: String
    var tutorial: Tutorial
    var tutorialItems: [TutorialItem]
    var videoURL: URL?
    var topDescription: LabelLabel.ViewModel {
        .init(topText: title, bottomText: subTitle)
    }
}
