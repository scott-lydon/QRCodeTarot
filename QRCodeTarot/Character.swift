//
//  Character.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 4/4/22.
//

import Foundation

extension Character {

    var int: Int? {
        Int(String(self))
    }

    var wordInt: Int? {
        switch self.lowercased() {
        case "ace": return 1
        case "one": return 1
        case "two": return 2
        case "three": return 3
        case "four": return 4
        case "five": return 5
        case "six": return 6
        case "seven": return 7
        case "eight": return 8
        case "nine": return 9
        case "ten": return 10
        default: return nil
        }
    }
}
