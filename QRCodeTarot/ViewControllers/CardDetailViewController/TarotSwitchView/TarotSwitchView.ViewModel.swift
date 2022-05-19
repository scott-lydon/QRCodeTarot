//
//  TarotSwitchView.ViewModel.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 5/18/22.
//

import UIKit
import TableMVVM

typealias StringAction = (String?) -> Void

extension TarotSwitchView {
    struct ViewModel: HasFallBack {
        static var fallBack: TarotSwitchView.ViewModel {
            .init()
        }

        var isLeft: Bool = true
        var didSwitchTo: StringAction?

        var leftColor: UIColor {
            isLeft ? .black : .white
        }

        var rightColor: UIColor {
            isLeft ? .white : .black
        }
    }
}
