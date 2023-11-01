//
//  PickDigitalCardView.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 6/15/23.
//

import SwiftUI

// MARK: - Lets users choose cards without purchasing the deck.  Displays 56 digital card backs. Tapping a card flips it. 

struct PickDigitalCardView: View {
    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 6)
    @State private var cardDeck: [Card] = []
    @State var show: Bool = false

    var body: some View {
        VStack {
            Button("Shuffle") {
                show = false
            }
            ScrollView {
                if show {
                    LazyVGrid(columns: columns, spacing: 10) {
                        ForEach(cardDeck, id: \.self) { card in
                            NavigationLink(destination: SaveAndShowCardDetailView(card: card)) {
                                Image(uiImage: UIImage(named: "gameCards") ?? UIImage())
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .drawingGroup()
                            }
                        }
                    }
                    .padding()
                } else {
                    ProgressView()
                        .onAppear {
                            DispatchQueue.main.async {
                                self.show = true
                                cardDeck = Card.allCases.shuffled()
                            }
                        }
                }
            }
        }
    }
}
