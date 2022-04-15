//
//  MenuViewController.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 4/14/22.
//

import UIKit
import TableMVVM

class MenuViewController: UIViewController {

    typealias MenuDataSource = TableDataSource1<
        Section<
            HeaderFooter<SimpleTextCell>,
            ViewModelCell<SimpleTextCell>
        >
    >

    static func instantiate() -> MenuViewController {
        let menuViewController: MenuViewController = UIStoryboard.vc()!
        menuViewController.loadView()
        menuViewController.view.inject(
            view: UITableMVVM<MenuDataSource>(
                viewModel: MenuDataSource(
                    section0: .init(
                        headerViewModel: "Good Stuff",
                        cellsViewModels: ["First", "Second", "Third"],
                        cellTapped: { rowText, indexPath in
                            // transition to appropriate view.
                            print("row text: \(rowText), indexPath: \(indexPath)")
                            menuViewController.navigationController?.pushViewController(<#T##UIViewController#>, animated: true)
                        }
                    )
                )
            )
        )
        return menuViewController
    }
}
