//
//  DeepLink.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 4/3/22.
//

import Foundation

// MARK: - DeepLink
struct DeeplinkPayload: Codable {
    let applinks: Applinks
    var cardKey: CardKey? { applinks.details.first?.card }
}

// MARK: - Applinks
struct Applinks: Codable {
    let details: [Detail]
}

// https://mocki.io/v1/74646ca2-9bce-4ad2-b623-f65f09cb3ac4 <- This can work as a QR code to show you with the internal scanner.
// MARK: - Detail
struct Detail: Codable {
    let appID: String
    let paths: [String]
    let card: CardKey
}



/*
 https://mocki.io/v1/40942a92-d1d3-404a-a0c3-a56bfc8db988
 // {"applinks":{"apps":[],"details":[{"appID":"8L7Z3WU967.com.QRCodeTarot","paths":[" * "]}]}}

 https://mocki.io/v1/e8e50d4c-a32f-4734-b067-f2a513138766
 // {"applinks":{"apps":[],"details":[{"appID":"<TeamID>.com.QRCodeTarot","paths":[" * "]}]}}

 https://mocki.io/v1/74646ca2-9bce-4ad2-b623-f65f09cb3ac4
 // {"applinks":{"apps":[],"details":[{"appID":"8L7Z3WU967.com.QRCodeTarot","paths":[{"symbol":"hearts","number":5,"deckVersion":1}]}]}}

 https://mocki.io/v1/74646ca2-9bce-4ad2-b623-f65f09cb3ac4
 // {"applinks":{"apps":[],"details":[{"appID":"8L7Z3WU967.com.QRCodeTarot","paths":[{"symbol":"hearts","number":5,"deckVersion":1}]}]}}

 https://mocki.io/v1/e751964d-9725-47e2-a055-51535bd29102
 // {"applinks":{"apps":[],"details":[{"appID":"8L7Z3WU967.com.QRCodeTarot","card":{"symbol":"hearts","number":5,"deckVersion":1},"paths":["*"]}]}}

 https://mocki.io/v1/e751964d-9725-47e2-a055-51535bd29102
 // {"applinks":{"apps":[],"details":[{"appID":"8L7Z3WU967.com.QRCodeTarot","card":{"symbol":"hearts","number":5,"deckVersion":1},"paths":["*"]}]}}

 */
