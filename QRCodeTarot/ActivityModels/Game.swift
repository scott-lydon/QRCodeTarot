//
//  Game.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 5/12/22.
//

import Foundation

struct Game: CanDisplayTutorial, CaseIterable {
    var title: String
    var subTitle: String
    var summary: String
    var tutorial: Tutorial

    static var allCases: [Game] {
        []
    }
}
