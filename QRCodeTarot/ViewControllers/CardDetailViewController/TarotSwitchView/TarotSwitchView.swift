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
