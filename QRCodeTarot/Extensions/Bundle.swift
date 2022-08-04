//
//  Bundle.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 4/4/22.
//

import Foundation

extension Bundle {

    static var localCards: Cards {
        // unit tested.
        let url = Bundle.main.path(forResource: "card_data", ofType: "json")!.fileurl!
        return try! Data(contentsOf: url, options: .mappedIfSafe).codable()!
    }

    var bookT: URL? {
        url(forResource: "BookT", withExtension: "json")
    }
    var oracleOfTarot: URL? {
        url(forResource: "OracleOfTheTarot", withExtension: "json")
    }
    var tarotMeaning: URL? {
        url(forResource: "TarotMeaning", withExtension: "json")
    }
    var pictoralKeyToTheTarot: URL? {
        url(forResource: "PictoralKeyToTheTarot", withExtension: "json")
    }
}
