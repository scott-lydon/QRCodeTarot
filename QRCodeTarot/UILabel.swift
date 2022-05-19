//
//  UILabel.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 5/18/22.
//

import Foundation
import UIKit

extension UILabel {
    /// Call this no more than once per UILabel instance.
    func setDynamicText() {
        font = font.dynamic
        adjustsFontForContentSizeCategory = true
    }
}
