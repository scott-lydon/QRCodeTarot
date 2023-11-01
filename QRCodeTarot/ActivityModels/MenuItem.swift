//
//  MenuItem.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 5/12/22.
//

import UIKit

enum MenuItem: CaseIterable {
   // case activity(Activity)
    case tarotCards([Card])
    case tarotCardReader
    case pickDigitalCard([Card])
    case history

    static var allCases: [MenuItem] {
        [
            .tarotCardReader,
            .tarotCards(Card.allCases),
            .history,
            .pickDigitalCard(Card.allCases),
        ]
    }

    var choiceViewModel: ChoiceView.ViewModel {
        .init(text: name, image: image, tintColor: self.tintColor)
    }

    var name: String {
        switch self {
      //  case .activity(let activity): return activity.name
        case .tarotCards: return "Tarot Cards"
        case .tarotCardReader: return "Tarot Reader"
        case .pickDigitalCard: return "Digital picker"
        case .history: return "History"
        }
    }

    var tintColor: UIColor? {
        switch self {
       // case .activity: return nil
        case .tarotCards: return nil
        case .tarotCardReader: return .gentleGray
        case .pickDigitalCard: return .gentleYellow
        case .history: return .gentlePink
        }
    }

    var image: UIImage {
        switch self {
        //case .activity(let activity): return activity.image
        case .tarotCards: return .gameCards
        case .tarotCardReader: return .qrCode
        case .pickDigitalCard(_): return .digitalPicker
        case .history: return .history
        }
    }
}
