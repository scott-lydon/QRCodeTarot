//
//  GradientView.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 5/9/22.
//

import UIKit

final class BottomLeftToTopRightGradient: CommonInitView {

    private let gradient = CAGradientLayer()
    private let gradientStartColor: UIColor = .gradientStartGray
    private let gradientEndColor: UIColor = .gradientEndGray

    override func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: layer)
        gradient.frame = self.bounds
        backgroundColor = .clear
    }

    override func draw(_ rect: CGRect) {
        gradient.frame = self.bounds
        gradient.colors = [gradientStartColor.cgColor, gradientEndColor.cgColor]
        if gradient.superlayer == nil {
            layer.insertSublayer(gradient, at: 0)
        }
        backgroundColor = .clear

        gradient.startPoint = CGPoint(x: 1, y: 0 )
        gradient.endPoint = CGPoint(x: 0, y: 1)
    }

    override func commonInit() {
        backgroundColor = .clear
    }
}
