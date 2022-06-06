//
//  ChoiceView.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 5/3/22.
//

import UIKit
import TableMVVM
import CommonUIKitExtensions

/// Used in the MenuViewController. 
class ChoiceView: NibView, HasViewModel {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var label: UILabel!
    @IBOutlet var gradientView: UIView!
    @IBOutlet var aspectRatio: NSLayoutConstraint!

    var viewModel: ViewModel = .fallBack {
        didSet {
            self.imageView.image = viewModel.image
            self.imageView.roundCorners(constant: 10)
            self.label.text = viewModel.text
            aspectRatio = aspectRatio.setMultiplier(multiplier: viewModel.ratio)
        }
    }
}

extension NSLayoutConstraint {
    /**
     Change multiplier constraint

     - parameter multiplier: CGFloat
     - returns: NSLayoutConstraint
    */
    func setMultiplier(multiplier:CGFloat) -> NSLayoutConstraint {

        NSLayoutConstraint.deactivate([self])

        let newConstraint = NSLayoutConstraint(
            item: firstItem as Any,
            attribute: firstAttribute,
            relatedBy: relation,
            toItem: secondItem,
            attribute: secondAttribute,
            multiplier: multiplier,
            constant: constant)

        newConstraint.priority = priority
        newConstraint.shouldBeArchived = self.shouldBeArchived
        newConstraint.identifier = self.identifier

        NSLayoutConstraint.activate([newConstraint])
        return newConstraint
    }
}
