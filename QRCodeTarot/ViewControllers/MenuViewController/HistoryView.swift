//
//  HistoryView.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 6/14/23.
//

import SwiftUI

struct HistoryView: View {
    var events: [CardPickEvent] // Card should be your model that has the details of card and date pulled

    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            Image(.darkColorShade)
                .resizable()
                .edgesIgnoringSafeArea(.all)
            List(events) { event in
                NavigationLink(destination: CardDetailView(card: event.card)) {
                    HStack {
                        Image(uiImage: event.card.image)
                            .resizable()
                            .frame(width: 50, height: 70)
                            .cornerRadius(3)
                        VStack {
                            HStack {
                                Text(event.card.name)
                                    .font(.title2)
                                Spacer()
                            }
                            Spacer()
                                .frame(height: 5)
                            HStack {
                                Text("Card pulled on: \(event.date.formattedDate)")
                                    .font(.caption)
                                Spacer()
                            }
                        }
                    }
                }
            }
            .background(Color.clear)
            .listRowInsets(EdgeInsets())
        }
        .navigationBarTitle("History")
    }
}
