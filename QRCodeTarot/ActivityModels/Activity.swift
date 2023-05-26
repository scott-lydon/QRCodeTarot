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

    func details(for row: Int) -> LabelLabel.ViewModel? {
        switch self {
        case .magicTricks(let tricks):
            return tricks[safe: row]?.topDescription

        case .games(let games):
            return games[safe: row]?.topDesription
        }
    }

    func tutorialSteps(for row: Int) -> [TutorialStepView.ViewModel]? {
        switch self {
        case .magicTricks(let tricks):
            return tricks[safe: row]?.tutorial.map(\.viewModel).correctlyNumbered

        case .games(let games):
            return games[safe: row]?.tutorial.map(\.viewModel).correctlyNumbered
        }
    }

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
        case .magicTricks: return "Magic Tricks"
        case .games: return "Games"
        }
    }

    var image: UIImage {
        switch self {
        case .magicTricks: return .magicHat
        case .games: return .gameController
        }
    }
}
