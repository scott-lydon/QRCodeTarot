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

        init(text: String, image: UIImage) {
            self.text = text
            self.image = image
        }

        init(_ card: Card) {
            self.init(text: card.name, image: card.image ?? .init())
        }

        static var fallBack: Self {
            .init(text: "Magic Trick", image: .magicHat)
        }
    }
}
