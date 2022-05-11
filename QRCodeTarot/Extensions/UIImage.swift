//
//  UIImage.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 4/14/22.
//

import UIKit

extension UIImage {

    static var hambugerMenu: UIImage {
        UIImage(
            systemName: "line.3.horizontal",
            withConfiguration: UIImage.SymbolConfiguration(pointSize: 30, weight: .bold)
        )! // unit tested.
    }

    static var star: UIImage {
        UIImage(named: #function)!
    }

    static var qrCode: UIImage {
        UIImage(named: #function)!
    }

    static var phone: UIImage {
        UIImage(named: #function)!
    }

    static var magicHat: UIImage {
        UIImage(named: #function)!
    }

    static var gameController: UIImage {
        UIImage(named: #function)!
    }

    static var gameCards: UIImage {
        UIImage(named: #function)!
    }

    static var darkColorShade: UIImage {
        UIImage(named: #function)!
    }

    static var brightColorShade: UIImage {
        UIImage(named: #function)!
    }

    static var chevronRight: UIImage {
        UIImage(systemName: "chevron.right")!
    }

    static var cardDemo: UIImage {
        UIImage(named: "07_swords")!
    }
}
