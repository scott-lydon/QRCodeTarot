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
                                // dismiss until the QRReader appears.
                                menuViewController.navigationController?.popToFirstOf(type: ViewController())
                                return
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
