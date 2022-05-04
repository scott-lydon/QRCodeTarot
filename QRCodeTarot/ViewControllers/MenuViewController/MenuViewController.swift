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
        
        let backgroundView = BackgroundView(frame: .zero)
//        backgroundView.inject(
//            view: UITableMVVM(
//                viewModel: MenuDataSource(
//                    section0: Section(
//                        headerViewModel: "Options",
//                        cellsViewModels: Row.allCases.map(\.rawValue),
//                        cellTapped: { rowText, indexPath in
//                            guard let row = Row(rawValue: rowText) else { return }
//                            let nextViewController: UIViewController
//                            switch row {
//                            case .tutorialRows(let subMenuType):
//                                nextViewController = SubMenuViewController.instantiate(with: subMenuType)
//                            case .tarotQRReader:
//                                menuViewController.navigationController?.popToFirstOf(type: QRREaderViewcontroller())
//                                return
//                            case .contact:
//                                nextViewController = ContactViewController.instantiate()
//                            }
//                            menuViewController.navigationController?
//                                .pushViewController(nextViewController, animated: true)
//                        }
//                    )
//                )
//            ).clear
//        )
        menuViewController.view.inject(view: backgroundView)
        return menuViewController
    }
}
