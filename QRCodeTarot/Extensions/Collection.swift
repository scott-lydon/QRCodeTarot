//
//  Collection.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 4/5/22.
//

import Foundation

extension Collection {

    subscript (safe index: Index) -> Element? {
        indices.contains(index) ? self[index] : nil
    }

    subscript (safe intIndex: Int) -> Element? {
        self[safe: index(startIndex, offsetBy: intIndex)]
    }

    var third: Element? {
        self[safe: 2]
    }

    var secondToLast: Element? {
        self[safe: (count - 2)]
    }

    var thirdToLast: Element? {
        self[safe: (count - 3)]
    }

    var fourthToLast: Element? {
        self[safe: (count - 4)]
    }

    var fifthToLast: Element? {
        self[safe: (count - 5)]
    }

    func firstOfType<T>() -> T? {
        compactMap { $0 as? T }.first
    }
}
