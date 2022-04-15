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

    enum Row: String, CaseIterable {
        case MagicTricks = "Magic Tricks"
        case games = "Games"
        case tarotCards = "Tarot Cards"
        case tarotQRReader = "Tarot QR Reader"
        case contact = "Contact"
    }

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
                            case .MagicTricks, .games, .tarotCards:
                                nextViewController = UIViewController()
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
