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
}
