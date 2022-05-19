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
        HeaderFooter<ImageLabelNoBorder>,
        ViewModelCell<SubMenuChoice>
    >
>

class SubMenuViewController: UIViewController {

    var dataSource: MenuDataSource = .init() {
        didSet {
            tableView.viewModel = dataSource
        }
    }

    lazy var tableView: UITableMVVM<MenuDataSource> = {
        UITableMVVM(viewModel: dataSource)
    }()

    var activity: Activity!

    static func instantiate(with activity: Activity) -> SubMenuViewController {
        let subMenuViewController: SubMenuViewController = UIStoryboard.vc()!//ut
        subMenuViewController.dataSource = MenuDataSource(
            section0: .init(
                headerViewModel: activity.imageLabelNoBorder,
                cellsViewModels: activity.submenuChoiceViewModels
            )
        )
        subMenuViewController.activity = activity
        return subMenuViewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.inject(view: tableView)
        view.set(background: BackgroundView.zero)
        tableView.backgroundColor = .clear
        dataSource.section0.cellTapped = { [weak self] subMenuChoice, indexPath in
            guard let self = self else { return }
            self.navigationController?.pushViewController(
                DetailsViewController.instantiate(
                    details: self.activity.details(for: indexPath.row) ?? .fallBack,
                    tutorialSteps: self.activity.tutorialSteps(for: indexPath.row) ?? []
                ),
                animated: true
            )
        }
    }
}
