//
//  TarotSwitchView.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 5/17/22.
//

import UIKit
import TableMVVM

class TarotSwitchView: NibView, HasViewModel {

    @IBOutlet var sliderLeading: NSLayoutConstraint!
    @IBOutlet var sliderTrailing: NSLayoutConstraint!

    @IBOutlet var sliderView: UIView! {
        didSet {
            sliderView.layer.cornerRadius = 12
            sliderView.layer.masksToBounds = true
        }
    }

    @IBOutlet var backgroundView: UIView! {
        didSet {
            backgroundView.backgroundColor = .darkBackground
            backgroundView.layer.cornerRadius = 12
            backgroundView.layer.masksToBounds = true
        }
    }

    @IBOutlet var evolvedButton: UIButton! {
        didSet {
            evolvedButton.titleLabel?.setDynamicText()
        }
    }

    @IBOutlet var unevolvedButton: UIButton! {
        didSet {
            unevolvedButton.titleLabel?.setDynamicText()
        }
    }

    @IBAction func evolvedTapped(_ sender: UIButton) {
        viewModel.isLeft = true
        viewModel.switchedToLeft?(true)
    }

    @IBAction func unevolvedTapped(_ sender: UIButton) {
        viewModel.isLeft = false
        viewModel.switchedToLeft?(false)
    }

    var viewModel: ViewModel = .init() {
        didSet {
            evolvedButton.setTitle(viewModel.leftText)
            unevolvedButton.setTitle(viewModel.rightText)
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
