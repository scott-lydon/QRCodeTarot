//
//  ShareButton.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 10/20/22.
//

import SwiftUI

struct ShareButton: View {
    var activityItems: [Any]
    var color: Color
    var height: CGFloat = 30

    var body: some View {
        Button {
            UIApplication
                .shared
                .windows
                .first?
                .rootViewController?
                .present(
                    UIActivityViewController(
                        activityItems: activityItems,
                        applicationActivities: nil
                    ),
                    animated: true
                )
        } label: {
            Image(systemName: "square.and.arrow.up")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: height, height: height)
                .foregroundColor(color)
        }
        .background(Color.clear)
    }
}

struct ShareButton_Previews: PreviewProvider {
    static var previews: some View {
        ShareButton(activityItems: ["hello friend"], color: .blue)
    }
}
