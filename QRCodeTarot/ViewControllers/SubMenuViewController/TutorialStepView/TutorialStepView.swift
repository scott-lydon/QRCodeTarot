//
//  TutorialStepView.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 5/10/22.
//

import TableMVVM
import UIKit

class TutorialStepView: NibView, HasViewModel {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var countLabel: UILabel! {
        didSet {
            countLabel.setDynamicText()
        }
    }
    @IBOutlet var stepLabelLabel: LabelLabel!
    @IBOutlet var countContainer: UIView!

    var viewModel: ViewModel = .init() {
        didSet {
            countContainer.roundCorners(constant: 12)
            imageView.roundCorners(constant: 12)
            imageView.isHidden = viewModel.image == nil
            imageView.image = viewModel.image
            imageView.contentMode = .scaleAspectFill
            countLabel.text = viewModel.count.string
            stepLabelLabel.viewModel = viewModel.stepDescription
        }
    }
}

extension TutorialStepView {

    struct ViewModel: HasFallBack {
        var image: UIImage?
        /// Sometimes this is given by the context.  
        var count: Int? = 1
        var stepDescription: LabelLabel.ViewModel = .fallBack

        static var fallBack: TutorialStepView.ViewModel {
            .init(image: .cardDemo, count: 1, stepDescription: .fallBack)
        }
    }
}
