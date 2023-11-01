//
//  Array.Of.Activities.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 5/12/22.
//

import Foundation


extension Array where Element == Card {
    var choiceMenuViewModels: [ChoiceView.ViewModel] {
        map(ChoiceView.ViewModel.init)
    }
}
