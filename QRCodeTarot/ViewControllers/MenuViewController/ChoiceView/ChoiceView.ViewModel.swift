//
//  ChoiceView.ViewModel.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 5/4/22.
//

import UIKit

extension ChoiceView {

    struct ViewModel {

        var text: String
        var image: UIImage

        static var fallBack: Self {
            .init(text: "Magic Trick", image: .magicHat)
        }
    }
}
