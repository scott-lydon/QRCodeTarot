//
//  MenuItem.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 5/12/22.
//

import UIKit

enum MenuItem: CaseIterable {
    case activity(Activity)
    case tarotCards([Card])
    case tarotCardReader

    static var allCases: [MenuItem] {
        [
            .tarotCardReader,
            .tarotCards(Card.allCases),
           // .activity(.magicTricks(MagicTrick.allCases)),
           // .activity(.games(Game.allCases)),
        ]
    }

    var choiceViewModel: ChoiceView.ViewModel {
        .init(text: name, image: image)
    }

    var name: String {
        switch self {
        case .activity(let activity): return activity.name
        case .tarotCards: return "Tarot Cards"
        case .tarotCardReader: return "Tarot Reader"
        }
    }

    var image: UIImage {
        switch self {
        case .activity(let activity): return activity.image
        case .tarotCards: return .gameCards
        case .tarotCardReader: return .qrCode
        }
    }
}
