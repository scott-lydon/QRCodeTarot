//
//  DetailsViewController.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 4/15/22.
//

import UIKit
import TableMVVM

typealias DetailDataSource = TableDataSource4<
    SectionOneRow<ViewModelCell<VideoView>>,
    SectionOneRow<ViewModelCell<LabelLabel>>,
    SectionOneRow<ViewModelCell<UILabel>>,
    SectionNoHeader<ViewModelCell<TutorialStepView>>
>

/// This is the tutorial view controller, needs a total revamp. 
class DetailsViewController: UIViewController {

    lazy var tableView: UITableMVVM<DetailDataSource> = UITableMVVM(viewModel: .init()).asClear()

    static func instantiate(
        details: LabelLabel.ViewModel,
        tutorialSteps: [TutorialStepView.ViewModel]
    ) -> DetailsViewController {
        let detailsViewController: DetailsViewController = UIStoryboard.vc()!
        detailsViewController.tableView.viewModel = TableDataSource4(
            section0: .init(cellViewModel: VideoView.ViewModel()),
            section1: .init(cellViewModel: details),
            section2: .init(cellViewModel: UILabel.ViewModel(color: .white, font: .inter(size: 16))),
            section3: .init(cellsViewModels: tutorialSteps.correctlyNumbered)
        )
        return detailsViewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.inject(view: tableView)
    }
}
