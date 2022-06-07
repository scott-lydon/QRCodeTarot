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
    @IBOutlet var labelLabel: LabelLabel!

    var viewModel: ViewModel = .fallBack {
        didSet {
            switchView.viewModel = viewModel.switchViewModel
            labelLabel.viewModel = viewModel.currentLabelModel
            switchView.isHidden = viewModel.hideSwitch
            labelLabel.isHidden = viewModel.hideLabelLabel
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
