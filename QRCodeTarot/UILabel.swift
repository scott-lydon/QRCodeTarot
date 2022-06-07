//
//  UILabel.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 5/18/22.
//

import UIKit
import TableMVVM

extension UILabel: HasViewModel {

    public var viewModel: ViewModel {
        get {
            return .init(text: text ?? "-", color: tintColor, font: font, alignment: textAlignment)
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
        var font: UIFont = UIFont.inter(size: 16)
        var alignment: NSTextAlignment = .left

        public static var fallBack: UILabel.ViewModel {
            .init()
        }
    }

    func with(text: String) -> Self {
        self.text = text
        return self
    }

    func with(lineCount: Int) -> Self {
        self.numberOfLines = lineCount
        return self
    }

    /// Call this no more than once per UILabel instance.
    func setDynamicText() {
        font = font.dynamic
        adjustsFontForContentSizeCategory = true
        setContentCompressionResistancePriority(.required, for: .horizontal)
        setContentCompressionResistancePriority(.required, for: .vertical)
    }
}
