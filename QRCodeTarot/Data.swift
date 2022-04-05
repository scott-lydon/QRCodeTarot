//
//  Data.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 4/4/22.
//

import Foundation

extension Data {
    func codable<T: Codable>() -> T? {
        T(self)
    }
}
