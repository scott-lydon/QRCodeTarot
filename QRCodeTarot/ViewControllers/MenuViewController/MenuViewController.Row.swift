//
//  MenuViewController.Row.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 4/15/22.
//

import UIKit

extension MenuViewController {

    enum Row: CaseIterable {

        case tutorialRows(SubMenuViewController.TutorialRowType)
        case tarotQRReader
        case contact

        init?(rawValue: String) {
            if let tutorialRow =  SubMenuViewController.TutorialRowType(rawValue: rawValue) {
                self = .tutorialRows(tutorialRow)
            } else if rawValue == "Tarot QR Reader" {
                self = .tarotQRReader
            } else if rawValue == "Contact" {
                self = .contact
            } else {
                return nil
            }
        }

        var rawValue: String {
            switch self {
            case .tutorialRows(let tutorialRow): return tutorialRow.rawValue
            case .tarotQRReader: return "Tarot QR Reader"
            case .contact: return "Contact"
            }
        }

        static var allCases: [MenuViewController.Row] {
            SubMenuViewController.TutorialRowType.allCases.map { .tutorialRows($0)} +
            [.tarotQRReader, .contact]
        }
    }
}
