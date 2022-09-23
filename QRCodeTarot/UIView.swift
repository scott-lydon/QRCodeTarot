//
//  UIView.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 4/14/22.
//

import UIKit

extension UIView {
    /// Inserts a subview and constrains it to fill this view (the superview) by default.
    ///  Using string formats supports older OS.  This has an early exit if the
    /// view is already injected.  This also clears the subViews before injecting.
    /// - Parameters:
    ///   - view: The view you are injecting
    func inject(view: UIView, insets: UIEdgeInsets = .zero) {
        guard !subviews.contains(view) else { return }
        view.frame = bounds
        addSubview(view)
        pinToEdges(view: view, insets: insets)
    }

    func pinToEdges(view: UIView, insets: UIEdgeInsets = .zero) {
        view.translatesAutoresizingMaskIntoConstraints = false
        [
            topAnchor.constraint(equalTo: view.topAnchor, constant: -insets.top),
            leftAnchor.constraint(equalTo: view.leftAnchor, constant: -insets.left),
            rightAnchor.constraint(equalTo: view.rightAnchor, constant: insets.right),
            bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: insets.bottom)
        ].forEach {
            $0.isActive = true
        }
    }

    var clear: UIView {
        backgroundColor = .clear
        return self
    }

    func asClear() -> Self {
        backgroundColor = .clear
        return self
    }

    func set(background: UIView) {
        insertSubview(background, at: 0)
        pinToEdges(view: background)
    }

    static var zero: Self {
        Self(frame: .zero)
    }

    static func with(width: Double) -> Self {
        Self(frame: .init(x: 0, y: 0, width: width, height: 0))
    }

    func addGradiant() {
        let GradientLayerName = "gradientLayer"

        if let oldlayer = self.layer.sublayers?.filter({$0.name == GradientLayerName}).first {
            oldlayer.removeFromSuperlayer()
        }
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor(red: 0.02, green: 0.02, blue: 0.03, alpha: 1.00),
            UIColor(red: 0.11, green: 0.11, blue: 0.13, alpha: 1.00)
        ]
        gradientLayer.startPoint = .zero
        gradientLayer.endPoint = CGPoint(x: 1, y: 1 )
        gradientLayer.frame = self.bounds
        gradientLayer.name = GradientLayerName

        self.layer.insertSublayer(gradientLayer, at: 0)
    }

    func addGradient(toTop: NSNumber = 0.05) {
        let gradient = CAGradientLayer()
        assert(superview != nil, "make sure you add the view to the superview before adding the gradient.")
        gradient.frame = superview?.bounds
            .increasedWidth(by: 50) // idk why, but this prevents the chop off on the right side issue.
        ?? CGRect.null
        gradient.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradient.locations = [0.0, toTop]
        superview?.layer.mask = gradient
    }
}
