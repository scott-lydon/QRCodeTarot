//
//  Activity.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 5/12/22.
//

import UIKit

enum Activity: CaseIterable {

    case magicTricks([MagicTrick])
    case games([Game])
    case tarotCards([Card])

    static var allCases: [Activity] {
        [
            .magicTricks(MagicTrick.allCases),
            .games(Game.allCases),
            .tarotCards(Card.allCases)
        ]
    }

    var choiceViewModel: ChoiceView.ViewModel {
        .init(text: name, image: image)
    }

    var name: String {
        switch self {
        case .magicTricks(_): return "Magic Tricks"
        case .games(_): return "Games"
        case .tarotCards(_): return "Tarot Cards"
        }
    }

    var image: UIImage {
        switch self {
        case .magicTricks(_): return .magicHat
        case .games(_): return .gameController
        case .tarotCards(_): return .gameCards
        }
    }
}
