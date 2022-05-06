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

        var choiceViewModel: ChoiceView.ViewModel {
            .init(text: rawValue, image: image)
        }

        var image: UIImage {
            switch self {
            case .tutorialRows(let tutorialRow):
                return tutorialRow.image
            case .tarotQRReader:
                return .qrCode
            }
        }

        init?(rawValue: String) {
            if let tutorialRow = SubMenuViewController.TutorialRowType(rawValue: rawValue) {
                self = .tutorialRows(tutorialRow)
            } else if rawValue == "Tarot QR Reader" {
                self = .tarotQRReader
            } else {
                return nil
            }
        }

        var rawValue: String {
            switch self {
            case .tutorialRows(let tutorialRow): return tutorialRow.rawValue
            case .tarotQRReader: return "Tarot QR Reader"
            }
        }

        static var allCases: [MenuViewController.Row] {
            SubMenuViewController.TutorialRowType.allCases.map { .tutorialRows($0)} +
            [.tarotQRReader]
        }
    }
}
