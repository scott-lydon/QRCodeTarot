//
//  SubMenuViewController.swift
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

class SubMenuViewController: UIViewController {

    var dataSource: MenuDataSource = .init() {
        didSet {
            tableView.viewModel = dataSource
        }
    }

    lazy var tableView: UITableMVVM = {
        UITableMVVM(viewModel: dataSource)
    }()

    var tutorialRow: SubMenuViewController.TutorialRowType!

    static func instantiate(with tutorialRow: TutorialRowType) -> SubMenuViewController {
        let subMenuViewController: SubMenuViewController = UIStoryboard.vc()! // unitested
        subMenuViewController.tutorialRow = tutorialRow
        subMenuViewController.dataSource.section0.viewModel = tutorialRow.rawValue
        return subMenuViewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.inject(view: tableView)
        dataSource.section0.cellsViewModels = TutorialRowType(rawValue: dataSource.section0.viewModel)!.detailViewModels
        dataSource.section0.cellTapped = { [weak self] rowText, _ in
            self?.navigationController?.pushViewController(
                DetailsViewController.instantiate(with: rowText),
                animated: true
            )
        }
    }
}
