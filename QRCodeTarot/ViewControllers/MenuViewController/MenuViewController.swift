//
//  MenuViewController.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 4/14/22.
//

import UIKit
import TableMVVM

typealias MenuDataSource = TableDataSource1<
    Section<
        HeaderFooter<SimpleTextCell>,
        ViewModelCell<SimpleTextCell>
    >
>

class MenuViewController: UIViewController {

    static func instantiate() -> MenuViewController {
        let menuViewController: MenuViewController = UIStoryboard.vc()!
        menuViewController.loadView()
        menuViewController.view.inject(
            view: UITableMVVM<MenuDataSource>(
                viewModel: MenuDataSource(
                    section0: .init(
                        headerViewModel: "Options",
                        cellsViewModels: Row.allCases.map(\.rawValue),
                        cellTapped: { rowText, indexPath in
                            guard let row = Row(rawValue: rowText) else { return }
                            let nextViewController: UIViewController
                            switch row {
                            case .tutorialRows(let subMenuType):
                                nextViewController = SubMenuViewController.instantiate(with: subMenuType)
                            case .tarotQRReader:
                                nextViewController = UIViewController()
                            case .contact:
                                nextViewController = UIViewController()
                            }
                            menuViewController.navigationController?
                                .pushViewController(nextViewController, animated: true)
                        }
                    )
                )
            )
        )
        return menuViewController
    }
}

extension MenuViewController {

    enum Row: CaseIterable {

        case tutorialRows(SubMenuViewController.TutorialRowType)
        case tarotQRReader
        case contact

        init?(rawValue: String) {
            if let tutorialRow =  SubMenuViewController.TutorialRowType(rawValue: rawValue) {
                self = .tutorialRows(tutorialRow)
            } else if rawValue == "tarotQRReader" {
                self = .tarotQRReader
            } else if rawValue == "contact" {
                self = .contact
            }
            return nil
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
