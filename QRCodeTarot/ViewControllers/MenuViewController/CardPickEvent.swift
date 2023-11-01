//
//  CardPickEvent.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 6/14/23.
//

// MARK: - Holds data about card picking events, so that when a card was picked is recorded.

import SwiftKeychainWrapper
import Foundation
import CommonExtensions

struct CardPickEvent: Codable, Identifiable {

    var id: String { date.timeIntervalSince1970.string + card.name_short }

    var date: Date
    var card: Card

    private static let keychainKey = "cardPickEvents"

    init(card: Card, date: Date = .init()) {
        self.date = date
        self.card = card
    }

    func save() {
        let allEvents = [self] + (Self.allEvents) 
        guard let encoded = try? JSONEncoder().encode(allEvents) else { return }
        let stringData = String(data: encoded, encoding: .utf8)
        KeychainWrapper.standard.set(stringData ?? "", forKey: Self.keychainKey)
    }

    static var allEvents: [Self] {
        guard let eventsString = KeychainWrapper.standard.string(forKey: Self.keychainKey) else { return [] }
        return (try? JSONDecoder().decode([Self].self, from: Data(eventsString.utf8))) ?? []
    }
}

extension Date {
    var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, M/dd/yy, 'at' h:mm a zzz"
        return formatter.string(from: self)
    }
}
