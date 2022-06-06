//
//  CGFloat.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 5/4/22.
//

import UIKit

extension CGFloat {

    func minus(_ number: Self) -> Self {
        self - number
    }

    func divided(by denominator: Self) -> Self {
        self / denominator
    }

    var square: CGSize {
        CGSize(width: self, height: self)
    }

    static var cardRatio: CGFloat {
        1440/1900
    }
}
