//
//  ShowAndSaveCardDetailView.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 6/15/23.
//

import SwiftUI

// MARK: - Provided to separate concerns and save the card when presenting.

struct SaveAndShowCardDetailView: View {
    let card: Card

    var body: some View {
        CardDetailView(card: card).onAppear(perform: CardPickEvent(card: card).save)
    }
}
