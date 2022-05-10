//
//  Int.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 5/6/22.
//

import Foundation

extension Int {
    var decimal: Decimal {
        Decimal(self)
    }

    var leadingZero: String {
        String(format: "%02d", self)
    }
}
