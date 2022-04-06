//
//  String.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 4/4/22.
//

import Foundation

extension String {

    var fileurl: URL? {
        URL(fileURLWithPath: self)
    }

    var int: Int? {
        Int(self)
    }
}