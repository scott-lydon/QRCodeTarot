//
//  EvolvedWithText.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 6/7/22.
//

import UIKit
import TableMVVM

class EvolvedWithText: NibView, HasViewModel {

    @IBOutlet var switchView: TarotSwitchView!
    @IBOutlet var title: UILabel!
    @IBOutlet var label: UILabel!

    var viewModel: ViewModel = .fallBack {
        didSet {
            switchView.viewModel = viewModel.switchViewModel
            title.viewModel = viewModel.titleViewModel
            label.viewModel = viewModel.currentLabelModel
            switchView.isHidden = viewModel.hideSwitch
            title.isHidden = viewModel.hideTitle
            label.isHidden = viewModel.hideLabel
            switchView.viewModel.switchedToLeft = { [weak self] toLeft in
                guard let self = self else { return }
                var buffer = self.viewModel
                buffer.switchViewModel.isLeft = toLeft
                self.viewModel = buffer
                self.viewModel.switchedToLeft?(toLeft)
            }
        }
    }
}
