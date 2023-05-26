//
//  UILabel.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 5/18/22.
//

import TableMVVM
import UIKit

extension UILabel: HasViewModel {
    public var viewModel: ViewModel {
        get {
            .init(text: text ?? "-", color: tintColor, font: font, alignment: textAlignment)
        }
        set {
            text = newValue.text
            textColor = newValue.color
            font = newValue.font
            textAlignment = newValue.alignment
        }
    }

    public struct ViewModel: HasFallBack {
        var text: String = "-"
        var color: UIColor = .white
        var font = UIFont.inter(size: 16)
        var alignment: NSTextAlignment = .left

        public static var fallBack: UILabel.ViewModel {
            .init()
        }
    }
}
