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

    static func instantiate(with activity: Activity) -> SubMenuViewController {
        let subMenuViewController: SubMenuViewController = UIStoryboard.vc()!//ut
        subMenuViewController.dataSource = MenuDataSource(
            section0: .init(
                headerViewModel: activity.imageLabelNoBorder,
                cellsViewModels: activity.submenuChoiceViewModels,
                cellTapped: { [weak subMenuViewController] subMenuChoiceVM, _ in
                    subMenuViewController?.navigationController?.pushViewController(
                        DetailsViewController.instantiate(
                            details: .fallBack,
                            tutorialSteps: []
                        ),
                        animated: true
                    )
                }
            )
        )
        return subMenuViewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.inject(view: tableView)
        view.set(background: BackgroundView.zero)
        tableView.backgroundColor = .clear
    }
}
