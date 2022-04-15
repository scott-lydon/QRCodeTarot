//
//  SubMenuViewController.TutorialRowType.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 4/15/22.
//

import Foundation

extension SubMenuViewController {

    enum TutorialRowType: String, CaseIterable {
        case MagicTricks = "Magic Tricks"
        case games = "Games"
        case tarotCards = "Tarot Cards"

        var detailViewModels: [String] {
            switch self {
            case .MagicTricks:
                return ["magic trick 1", "magic trick 2", "magic trick 3"]
            case .games:
                return ["game 1", "game 2", "game 3", "game 4", "game 5"]
            case .tarotCards:
                return ["card 1", "card 2", "card 3", "card 4", "card 5"]
            }
        }
    }
}
