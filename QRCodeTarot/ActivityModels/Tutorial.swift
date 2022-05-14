//
//  Tutorial.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 5/12/22.
//

import UIKit

typealias Tutorial = [TutorialItem]

enum TutorialItem {
    case image(UIImage)
    case step(TutorialItem.Step)
}

extension TutorialItem {
    struct Step {
        var image: UIImage?
        var title: String?
        var description: String
    }
}
