//
//  CGRect.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 9/23/22.
//

import UIKit

extension CGRect {
    func increasedWidth(by amount: CGFloat) -> CGRect {
        .init(
            x: self.minX,
            y: self.minY,
            width: self.width + amount,
            height: self.height
        )
    }
}
