//
//  TarotSwitchView.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 5/17/22.
//

import UIKit

class TarotSwitchView: NibView {


    


    var viewModel: ViewModel = .init() {
        didSet {

        }
    }
}

typealias StringAction = (String) -> Void

extension TarotSwitchView {
    struct ViewModel {
        var didSwitchTo: StringAction?
    }
}
