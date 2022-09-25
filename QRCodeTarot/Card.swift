//
//  Card.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 4/3/22.
//

import UIKit
import Callable

// MARK: - Card
struct Card: Codable, CaseIterable {
    
    let type: Importance
    let name_short: String
    let name: String
    let value: String
    let value_int: Int
    let meaning_up: String
    let meaning_rev: String
    let desc: String
    let suit: Suit?
    let evolved: String?
    let unevolved: String?
    
    var hasNoEvolutionContent: Bool {
        evolved.isEmpty && unevolved.isEmpty
    }

    var choiceViewModel: ChoiceView.ViewModel {
        .init(text: name.capitalized, image: image ?? .cardDemo, ratio: .cardRatio, cornerRadius: 10)
    }

    var evolvedSwitchViewModel: EvolvedWithText.ViewModel {
        .init(
            labelLeftModel: evolvedViewModel,
            labelRightModel: unevolvedViewModel,
            switchViewModel: TarotSwitchView.ViewModel(
                isLeft: !evolvedViewModel.bottomText.isEmpty,
                switchedToLeft: nil
            ),
            switchedToLeft: nil
        )
    }

    var evolvedViewModel: LabelLabel.ViewModel {
        .init(topText: "Evolved", bottomText: evolved)
    }

    var unevolvedViewModel: LabelLabel.ViewModel {
        .init(topText: "Unevolved", bottomText: unevolved)
    }

    static var allCases: [Card] {
        let tarotMeanings: [TarotMeaning] = try! Bundle.main.tarotMeaning?.localCodable() ?? []
        return tarotMeanings.cards
    }

    var image: UIImage? {
        UIImage(named: "\(value_int.leadingZero)_\(suit?.rawValue ?? "")")
    }

    func matches(key: CardKey) -> Bool {
        suit == key.symbol.suit && key.number == value_int
    }

    enum CodingKeys: String, CodingKey {
        case type
        case name_short
        case name
        case value
        case value_int
        case meaning_up
        case meaning_rev
        case desc
        case suit
        case evolved
        case unevolved
    }
}
