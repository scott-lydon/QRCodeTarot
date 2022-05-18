//
//  TarotSwitchView.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 5/17/22.
//

import UIKit
import TableMVVM

class TarotSwitchView: NibView, HasViewModel {

    @IBOutlet var sliderView: UIView!
    @IBOutlet var sliderLeading: NSLayoutConstraint!
    @IBOutlet var sliderTrailing: NSLayoutConstraint!

    @IBOutlet var evolvedButton: UIButton!
    @IBOutlet var unevolvedButton: UIButton!

    @IBAction func evolvedTapped(_ sender: Any) {
        viewModel.isLeft = true
    }

    @IBAction func unevolvedTapped(_ sender: Any) {
        viewModel.isLeft = false
    }

    var viewModel: ViewModel = .init() {
        didSet {
            sliderLeading.isActive = viewModel.isLeft
            sliderTrailing.isActive = !viewModel.isLeft
            evolvedButton.setTitleColor(viewModel.leftColor, for: .normal)
            unevolvedButton.setTitleColor(viewModel.rightColor, for: .normal)
            evolvedButton.layer.cornerRadius = 12
            evolvedButton.layer.masksToBounds = true
            unevolvedButton.layer.cornerRadius = 12
            unevolvedButton.layer.masksToBounds = true
            UIView.animate(withDuration: 0.5) {
                self.layoutIfNeeded()
            }
        }
    }
}

typealias StringAction = (String) -> Void

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
