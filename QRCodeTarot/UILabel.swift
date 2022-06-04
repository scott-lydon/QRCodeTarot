//
//  UILabel.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 5/18/22.
//

import UIKit
import TableMVVM
import CommonUIKitExtensions

extension UILabel {
    /// Call this no more than once per UILabel instance.
    func setDynamicText() {
        font = font.dynamic

        adjustsFontForContentSizeCategory = true
        setContentCompressionResistancePriority(.required, for: .horizontal)
        setContentCompressionResistancePriority(.required, for: .vertical)
    }

    func with(text: String) -> UILabel {
        self.text = text
        return self
    }

    func lineCount(withWidth: Int) -> Int {
        let label = UILabel(
            frame: CGRect(
                x: 0,
                y: 0,
                width: withWidth,
                height: .max
            )
        ).with(lineCount: 0)
        label.text = text
        return label.actualLineCount
    }

    func with(lineCount: Int) -> UILabel {
        numberOfLines = lineCount
        return self
    }
}

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
}
