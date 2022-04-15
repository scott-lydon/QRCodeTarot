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

extension SubMenuViewController {

    enum TutorialRowType: String, CaseIterable {
        case MagicTricks = "Magic Tricks"
        case games = "Games"
        case tarotCards = "Tarot Cards"

        var detailViewModels: [String] {
            switch self {
            case .MagicTricks:
                return ["magic trick 1", "magic trick 2", "magic trick 3"]
            case .games:
                return ["game 1", "game 2", "game 3", "game 4", "game 5"]
            case .tarotCards:
                return ["card 1", "card 2", "card 3", "card 4", "card 5"]
            }
        }
    }
}
