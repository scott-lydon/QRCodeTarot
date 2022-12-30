//
//  View.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 10/21/22.
//

import SwiftUI
import UIKit

extension View {
    func maskedGradient(
        startPoint: UnitPoint = .top,
        endPoint: UnitPoint = .center
    ) -> some View {
        mask(
            LinearGradient(
                gradient: Gradient(
                    stops: [
                        .init(color: Color.white.opacity(0), location: 0),
                        .init(color: .white, location: 0.1),
                        .init(color: .white, location: 0.11)
                    ]
                ),
                startPoint: startPoint,
                endPoint: endPoint
            )
        )
    }

    @inlinable public func font(ui: UIFont) -> some View {
        font(Font(uiFont: ui))
    }

    @inlinable func allPreviews() -> some View {
        Group {
            previewDevice("iPhone 14 Pro Max")
            if #available(iOS 15.0, *) {
                previewInterfaceOrientation(.landscapeLeft)
                    .previewDevice("iPhone 14 Pro Max")
                previewInterfaceOrientation(.portrait)
                    .previewDevice("iPhone SE (3rd generation)")
                previewInterfaceOrientation(.landscapeLeft)
                    .previewDevice("iPhone SE (3rd generation)")
            } else {
                // Fallback on earlier versions
            }
        }
    }
}

public extension Font {
    init(uiFont: UIFont) {
        self = Font(uiFont as CTFont)
    }
}
