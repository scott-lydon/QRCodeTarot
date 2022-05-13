//
//  Activity.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 5/12/22.
//

import UIKit

enum Activity {

    case magicTricks([MagicTrick])
    case games([Game])
    case tarotCards([Card])
    case tarotQRReader

    var choiceViewModel: ChoiceView.ViewModel {
        .init(text: name, image: image)
    }

    var name: String {
        switch self {
        case .magicTricks(_): return "Magic Tricks"
        case .games(_): return "Games"
        case .tarotCards(_): return "Tarot Cards"
        case .tarotQRReader: return "Tarot QR Reader"
        }
    }

    var image: UIImage {
        switch self {
        case .magicTricks(_): return .magicHat
        case .games(_): return .gameController
        case .tarotCards(_): return .gameCards
        case .tarotQRReader: return .qrCode
        }
    }
}

