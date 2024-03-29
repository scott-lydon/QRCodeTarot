//
//  TarotSwitchView.ViewModel.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 5/18/22.
//

import TableMVVM
import UIKit

typealias BoolAction = (Bool) -> Void

extension TarotSwitchView {
    struct ViewModel: HasFallBack {
        static var fallBack: TarotSwitchView.ViewModel {
            .init()
        }

        var isLeft = true
        var switchedToLeft: BoolAction?
        var leftText: String = "Evolved"
        var rightText: String = "Unevolved"

        var leftColor: UIColor {
            isLeft ? .black : .white
        }

        var rightColor: UIColor {
            isLeft ? .white : .black
        }
    }
}
