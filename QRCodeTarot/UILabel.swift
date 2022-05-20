//
//  UILabel.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 5/18/22.
//

import UIKit
import TableMVVM

extension UILabel {
    /// Call this no more than once per UILabel instance.
    func setDynamicText() {
        font = font.dynamic
        adjustsFontForContentSizeCategory = true
        setContentCompressionResistancePriority(.required, for: .horizontal)
        setContentCompressionResistancePriority(.required, for: .vertical)
    }
}

extension UILabel: HasViewModel {

    public var viewModel: ViewModel {
        get {
            return .init(color: tintColor, font: font)
        }
        set {
            textColor = newValue.color
            font = newValue.font
        }
    }

    public struct ViewModel: HasFallBack {
        var color: UIColor = .white
        var font: UIFont = UIFont.inter(size: 16)

        public static var fallBack: UILabel.ViewModel {
            .init()
        }
    }
}
