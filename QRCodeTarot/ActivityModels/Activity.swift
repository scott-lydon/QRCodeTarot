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

    var imageLabelNoBorder: ImageLabelNoBorder.ViewModel {
        .init(image: image, text: name)
    }

    var submenuChoiceViewModels: [SubMenuChoice.ViewModel] {
        switch self {
        case .magicTricks(let tricks): return tricks.subMenuViewModels
        case .games(let games): return games.subMenuViewModels
        }
    }

    var choiceViewModel: ChoiceView.ViewModel {
        .init(text: name, image: image)
    }

    var name: String {
        switch self {
        case .magicTricks(_): return "Magic Tricks"
        case .games(_): return "Games"
        }
    }

    var image: UIImage {
        switch self {
        case .magicTricks(_): return .magicHat
        case .games(_): return .gameController
        }
    }
}
