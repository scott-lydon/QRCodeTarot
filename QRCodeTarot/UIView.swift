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
        pinToEdges(view: view)
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

    func set(background: UIView) {
        insertSubview(background, at: 0)
        pinToEdges(view: background)
    }

    static var zero: Self {
        Self(frame: .zero)
    }
}
