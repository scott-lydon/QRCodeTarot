//
//  UIColor.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 5/4/22.
//

import UIKit

extension UIColor {
    static var offWhiteGray: UIColor {
        UIColor(red: 0.854, green: 0.854, blue: 0.971, alpha: 1)
    }

    static var nearBlack: UIColor {
        UIColor(red: 0.11, green: 0.115, blue: 0.13, alpha: 1)
    }

    static var tarotLightGray: UIColor {
        UIColor(red: 179 / 255.0, green: 179 / 255.0, blue: 179 / 255.0, alpha: 1)
    }

    static var darkBorder: UIColor {
        UIColor(red: 47 / 255.0, green: 49 / 255.0, blue: 55 / 255.0, alpha: 1)
    }

    /// Set gray border for the card detail view.
    static var grayBorder: UIColor {
        UIColor(red: 0.18, green: 0.19, blue: 0.22, alpha: 1.00)
    }

    static var gradientStartGray: UIColor {
        UIColor(red: 0.02, green: 0.02, blue: 0.03, alpha: 1.00)
    }

    static var gradientEndGray: UIColor {
        UIColor(red: 0.11, green: 0.11, blue: 0.13, alpha: 1.00)
    }

    /// out of focus color
    ///  #151619
    static var darkBackground: UIColor {
        UIColor(red: 0.08, green: 0.09, blue: 0.10, alpha: 1.00)
    }

    /// #F7F7F7
    static var nearWhite: UIColor {
        UIColor(red: 0.97, green: 0.97, blue: 0.97, alpha: 1.00)
    }

    /// #B3B3B3
    static var deselectedGray: UIColor {
        UIColor(red: 0.70, green: 0.70, blue: 0.70, alpha: 1.00)
    }

    /// UIColor(red: 0.61, green: 0.62, blue: 0.67, alpha: 1.00)
    /// #9B9FAB
    static var gentleText: UIColor {
        UIColor(red: 0.61, green: 0.62, blue: 0.67, alpha: 1.00)
    }

    static var hex9B9FAB: UIColor {
        UIColor(red: 0.61, green: 0.62, blue: 0.67, alpha: 1.00)
    }
}
