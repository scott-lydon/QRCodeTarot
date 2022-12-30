//
//  Array.Of.Activities.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 5/12/22.
//

import Foundation

extension Array where Element == MagicTrick {
    var subMenuViewModels: [SubMenuChoice.ViewModel] {
        map(SubMenuChoice.ViewModel.init)
    }
}

extension Array where Element == Game {
    var subMenuViewModels: [SubMenuChoice.ViewModel] {
        map(SubMenuChoice.ViewModel.init)
    }
}

extension Array where Element == Card {
    var choiceMenuViewModels: [ChoiceView.ViewModel] {
        map(ChoiceView.ViewModel.init)
    }
}
