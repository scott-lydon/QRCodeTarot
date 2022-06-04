//
//  DetailsViewController.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 4/15/22.
//

import UIKit
import TableMVVM

typealias DetailDataSource = TableDataSource3<
    SectionOneRow<ViewModelCell<VideoView>>,
    SectionOneRow<ViewModelCell<LabelLabel>>,
    Section<
        HeaderFooter<UILabel>,
        ViewModelCell<TutorialStepView>
    >
>

/// This is the tutorial view controller, needs a total revamp. 
class DetailsViewController: UIViewController {

    var dataSource: DetailDataSource = .init() {
        didSet {
            tableView.viewModel = dataSource
        }
    }

    lazy var tableView: UITableMVVM<DetailDataSource> = {
        UITableMVVM(viewModel: dataSource).asClear()
    }()

    static func instantiate(
        details: LabelLabel.ViewModel,
        tutorialSteps: [TutorialStepView.ViewModel]
    ) -> DetailsViewController {
        let detailsViewController: DetailsViewController = UIStoryboard.vc()!
        detailsViewController.dataSource = TableDataSource3(
            section0: .init(cellViewModel: VideoView.ViewModel()),
            section1: .init(cellViewModel: details),
            section2: .init(
                headerViewModel: UILabel.ViewModel(color: .white, font: .inter(size: 16)),
                cellsViewModels: tutorialSteps.correctlyNumbered
            )
        )
        return detailsViewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.inject(view: tableView)
      //  tableView.contentInset = .init(top: 0, left: 24, bottom: 0, right: -24) // right side seems to have no effect.
      //  tableView.contentInsetAdjustmentBehavior = .never
    }
}
