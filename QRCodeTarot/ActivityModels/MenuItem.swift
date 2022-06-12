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
    case tarotQRReader

    static var allCases: [MenuItem] {
        [
            .activity(.magicTricks(MagicTrick.allCases)),
            .activity(.games(Game.allCases)),
            .tarotCards(Card.allCases),
            .tarotQRReader
        ]
    }

    var choiceViewModel: ChoiceView.ViewModel {
        .init(text: name, image: image)
    }

    var name: String {
        switch self {
        case .activity(let activity): return activity.name
        case .tarotCards(_): return "Tarot Cards"
        case .tarotQRReader: return "Tarot Reader"
        }
    }

    var image: UIImage {
        switch self {
        case .activity(let activity): return activity.image
        case .tarotCards(_): return .gameCards
        case .tarotQRReader: return .qrCode
        }
    }
}
