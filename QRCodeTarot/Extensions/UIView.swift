//
//  UIView.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 4/14/22.
//

import UIKit
import CommonUIKitExtensions

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
}
