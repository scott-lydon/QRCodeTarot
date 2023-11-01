//
//  ChoiceView.ViewModel.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 5/4/22.
//

import TableMVVM
import UIKit

// MARK: - The model to popuplate the Choice View. Reusability comes from its initializers. 

extension ChoiceView {
    struct ViewModel: HasFallBack {
        var text: String
        var image: UIImage
        var tintColor: UIColor?
        var ratio: CGFloat
        var cornerRadius: CGFloat

        init(
            text: String,
            image: UIImage,
            tintColor: UIColor?,
            ratio: CGFloat = 1,
            cornerRadius: CGFloat = 0
        ) {
            self.text = text
            self.image = image
            self.tintColor = tintColor
            self.ratio = ratio
            self.cornerRadius = cornerRadius
        }

        init(_ card: Card) {
            self.init(
                text: card.name,
                image: card.image,
                tintColor: nil,
                ratio: .cardRatio,
                cornerRadius: 10
            )
        }

        static var fallBack: Self {
            .init(
                text: "Magic Trick",
                image: .magicHat,
                tintColor: nil
            )
        }
    }
}
