//
//  Card.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 4/3/22.
//

import UIKit
import Callable
import ARKit
import CommonExtensions

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
              let matchingCard = Card.allCases
            .first(where: { $0.value_int == number.int && $0.suit.string == suit }) else { return nil }
        self = matchingCard
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
        let bookTs: [BookTCard] = try! Bundle.main.bookT?.localCodable() ?? []
        let oracleTCards: [OracleOfTheTarotCard] = try! Bundle.main.oracleOfTarot?.localCodable() ?? []
        let pictoralCards: [PictoralKeyToTheTarotCard] = try! Bundle.main.oracleOfTarot?.localCodable() ?? []

        let bookTDictionary = Dictionary(uniqueKeysWithValues: bookTs.map{ ($0.hash, $0) })
        let oracleDictionary = Dictionary(uniqueKeysWithValues: oracleTCards.map { ($0.hash, $0)})
        let pictoralDictionary = Dictionary(uniqueKeysWithValues: pictoralCards.map { ($0.hash, $0)})

        print(bookTs.count, oracleTCards.count, pictoralCards.count)

        var cards: [Card] = []
        for suit in Suit.allCases {
            for num in 1..<15 {
                let hash = num.string + " " + suit.rawValue
                let bookT = bookTDictionary[hash]
                let oracle = oracleDictionary[hash]
                let pictoral = pictoralDictionary[hash]
                cards.append(
                    Card(
                        type: .minor,
                        name_short: hash,
                        name: "\(num.tarotNumberSpelledOut) of \(suit.rawValue)",
                        value: num.tarotNumberSpelledOut,
                        value_int: num,
                        meaning_up: bookT?.meaning ?? "",
                        meaning_rev: (oracle?.meaning ?? "") + " " + (oracle?.oracleOfTheTarotCardDescription ?? ""),
                        desc: pictoral?.pictoralKeyToTheTarotCardDescription ?? "",
                        suit: suit,
                        evolved: oracle?.wellDignified ?? "",
                        unevolved: oracle?.illDignified ?? ""
                    )
                )
            }
        }
        return cards
    }

    var referenceImage: ARReferenceImage? {
        guard let cgImage = image?.cgImage else { return nil }
        let referenceImage = ARReferenceImage(cgImage, orientation: .up, physicalWidth: 0.1)
        referenceImage.name = name
        return referenceImage
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
