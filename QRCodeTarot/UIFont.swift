//
//  UIFont.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 5/18/22.
//

import UIKit

extension UIFont {

    static func inter(size: CGFloat) -> UIFont {
        UIFont(name: "Inter", size: 16)!
    }

    /// Provides a dynamic version of the current font.
    var dynamic: UIFont {
        UIFontMetrics(forTextStyle: .init(size: pointSize)).scaledFont(for: self)
    }
}

extension UIFont.TextStyle {

    /// Initializes the closes size.
    init(size: CGFloat) {
        switch size {
        case 38...: self = .largeTitle
        case 30..<38: self = .largeTitle
        case 25..<30: self = .title1
        case 21..<25: self = .title2
        case 19..<21: self = .title3
        case 17: self = .body
        case 16: self = .callout
        case 14..<16: self = .subheadline
        case 13..<14: self = .footnote
        case 12: self = .caption1
        case 11: self = .caption2
        default: self = .caption2
        }
    }
}
