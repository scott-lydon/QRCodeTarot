//
//  Card.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 4/3/22.
//

import ARKit
import Callable
import CommonExtensions
import UIKit

// MARK: - Card
struct Card: Codable, CaseIterable, Identifiable, Hashable {

    var id: String { name_short }
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

    var random: Card! {
        Card.allCases.randomElement()
    }

    var hasNoEvolutionContent: Bool {
        evolved.isEmpty && unevolved.isEmpty
    }

    var activityItems: [Any] {
        let ending: String =
        """
        iOS Download: https://shorturl.at/dsxB1
        Buy the deck: https://shorturl.at/girz0
        """
        return [
            "Hey there!  Here is your Tarot reading from using Pointy Hat Tarot." +
            "\n\n" +
            ending +
            "\n\n" +
            name_short +
            "\n" +
            desc +
            "\n\n" +
            "Evolved:" +
            "\n" +
            (evolved ?? "") +
            "\n\n" +
            ending
        ]
    }

    init(
        type: Importance,
        name_short: String,
        name: String,
        value: String,
        value_int: Int,
        meaning_up: String,
        meaning_rev: String,
        desc: String,
        suit: Suit?,
        evolved: String?,
        unevolved: String?
    ) {
        self.type = type
        self.name_short = name_short
        self.name = name
        self.value = value
        self.value_int = value_int
        self.meaning_up = meaning_up
        self.meaning_rev = meaning_rev
        self.desc = desc
        self.suit = suit
        self.evolved = evolved
        self.unevolved = unevolved
    }

    init?(imageName: String) {
        let components = imageName.components(separatedBy: "_")
        guard let number = components.first,
              let suit = components[safe: 1],
              let matchingCard = Self.allCases
            .first(where: { $0.value_int == number.int && $0.suit.string == suit }) else { return nil }
        self = matchingCard
    }

    var choiceViewModel: ChoiceView.ViewModel {
        .init(
            text: name.capitalized,
            image: image,
            tintColor: nil,
            ratio: .cardRatio,
            cornerRadius: 10
        )
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

    var referenceImage: ARReferenceImage? {
        guard let cgImage = image.cgImage else { return nil }
        let referenceImage = ARReferenceImage(cgImage, orientation: .up, physicalWidth: 0.1)
        referenceImage.name = name
        return referenceImage
    }

    var image: UIImage {
        UIImage(named: "\(value_int.leadingZero)_\(suit?.rawValue ?? "")") ?? UIImage()
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
