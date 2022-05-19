//
//  TarotSwitchView.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 5/17/22.
//

import UIKit
import TableMVVM

class TarotSwitchView: NibView, HasViewModel {

    @IBOutlet var sliderView: UIView! {
        didSet {
            sliderView.layer.cornerRadius = 12
            sliderView.layer.masksToBounds = true
        }
    }
    @IBOutlet var sliderLeading: NSLayoutConstraint!
    @IBOutlet var sliderTrailing: NSLayoutConstraint!

    @IBOutlet var evolvedButton: UIButton!
    @IBOutlet var unevolvedButton: UIButton!

    @IBAction func evolvedTapped(_ sender: UIButton) {
        viewModel.isLeft = true
        viewModel.didSwitchTo?(sender.titleLabel?.text)
    }

    @IBAction func unevolvedTapped(_ sender: UIButton) {
        viewModel.isLeft = false
        viewModel.didSwitchTo?(sender.titleLabel?.text)
    }

    var viewModel: ViewModel = .init() {
        didSet {
            UIView.animate(withDuration: 0.5) {
                self.evolvedButton.tintColor = self.viewModel.leftColor
                self.unevolvedButton.tintColor = self.viewModel.rightColor
                self.sliderLeading.isActive = self.viewModel.isLeft
                self.sliderTrailing.isActive = !self.viewModel.isLeft
                self.layoutIfNeeded()
            }
        }
    }
}

typealias StringAction = (String?) -> Void

extension TarotSwitchView {
    struct ViewModel: HasFallBack {
        static var fallBack: TarotSwitchView.ViewModel {
            .init()
        }

        var isLeft: Bool = true
        var didSwitchTo: StringAction?

        var leftColor: UIColor {
            isLeft ? .black : .white
        }

        var rightColor: UIColor {
            isLeft ? .white : .black
        }
    }
}


extension UIFont {

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
