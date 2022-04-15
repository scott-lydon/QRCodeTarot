//
//  SubMenuViewController.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 4/14/22.
//

import UIKit
import TableMVVM

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
        dataSource.section0.cellTapped = { [weak self] rowText, indexPath in
            guard let self = self else { return }
            self.navigationController?.pushViewController(
                DetailsViewController.instantiate(with: self.tutorialRow.detailViewModels[indexPath.row]),
                animated: true
            )
        }
    }
}
