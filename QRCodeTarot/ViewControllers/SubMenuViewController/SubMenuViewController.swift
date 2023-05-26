//
//  SubMenuViewController.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 4/14/22.
//

import CommonUIKitExtensions
import TableMVVM
import UIKit

typealias MenuDataSource = TableDataSource2<
    SectionOneRow<ViewModelCell<ImageLabelNoBorder>>,
    SectionNoHeader<ViewModelCell<SubMenuChoice>>
>

class SubMenuViewController: UIViewController {
    var tableView = UITableMVVM<MenuDataSource>(viewModel: .init())
    var activity: Activity!
    @IBOutlet var tableContainer: UIView!

    static func instantiate(with activity: Activity) -> SubMenuViewController {
        let subMenuViewController: SubMenuViewController = UIStoryboard.vc()!// ut
        subMenuViewController.tableView.viewModel = MenuDataSource(
            section0: .init(cellViewModel: activity.imageLabelNoBorder),
            section1: .init(cellsViewModels: activity.submenuChoiceViewModels)
        )
        subMenuViewController.activity = activity
        return subMenuViewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableContainer.inject(view: tableView)
        view.set(background: BackgroundView.zero)
        tableView.backgroundColor = .clear
        tableView.addGradient(toTop: 0.05)
        tableView.showsVerticalScrollIndicator = false
        tableView.viewModel?.section1.cellTapped = { [weak self] _, indexPath in
            guard let self else { return }
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
