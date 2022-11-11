//
//  ChoiceView.ViewModel.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 5/4/22.
//

import UIKit
import TableMVVM

extension ChoiceView {

    struct ViewModel: HasFallBack {

        var text: String
        var image: UIImage
        var ratio: CGFloat
        var cornerRadius: CGFloat

        init(text: String, image: UIImage, ratio: CGFloat = 1, cornerRadius: CGFloat = 0) {
            self.text = text
            self.image = image
            self.ratio = ratio
            self.cornerRadius = cornerRadius
        }

        init(_ card: Card) {
            self.init(
                text: card.name,
                image: card.image,
                ratio: .cardRatio,
                cornerRadius: 10
            )
        }

        static var fallBack: Self {
            .init(text: "Magic Trick", image: .magicHat)
        }
    }
}
