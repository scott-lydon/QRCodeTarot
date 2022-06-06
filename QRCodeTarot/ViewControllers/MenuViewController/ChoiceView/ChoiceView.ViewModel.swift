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

        init(text: String, image: UIImage, ratio: CGFloat = 1) {
            self.text = text
            self.image = image
            self.ratio = ratio
        }

        init(_ card: Card) {
            self.init(
                text: card.name,
                image: card.image ?? .init(),
                ratio: .cardRatio
            )
        }

        static var fallBack: Self {
            .init(text: "Magic Trick", image: .magicHat)
        }
    }
}
