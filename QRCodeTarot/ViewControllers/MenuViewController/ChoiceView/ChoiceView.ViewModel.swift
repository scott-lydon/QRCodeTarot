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

        static var fallBack: Self {
            .init(text: "Magic Trick", image: .magicHat)
        }
    }
}
