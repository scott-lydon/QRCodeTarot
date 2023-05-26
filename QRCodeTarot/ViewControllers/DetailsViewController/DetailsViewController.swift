//
//  DetailsViewController.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 4/15/22.
//

import TableMVVM
import UIKit

typealias DetailDataSource = TableDataSource4<
    SectionOneRow<ViewModelCell<Container<VideoView>>>,
    SectionOneRow<ViewModelCell<Container<LabelLabel>>>,
    SectionOneRow<ViewModelCell<Container<UILabel>>>,
    SectionNoHeader<ViewModelCell<Container<TutorialStepView>>>
>

/// This is the tutorial view controller, needs a total revamp. 
class DetailsViewController: UIViewController {
    @IBOutlet var tableContainer: UIView!
    lazy var tableView: UITableMVVM<DetailDataSource> = UITableMVVM(viewModel: .init()).asClear()

    static func instantiate(
        details: LabelLabel.ViewModel,
        tutorialSteps: [TutorialStepView.ViewModel]
    ) -> DetailsViewController {
        let detailsViewController: DetailsViewController = UIStoryboard.vc()!
        detailsViewController.tableView.viewModel = TableDataSource4(
            section0: .init(cellViewModel: .init(insets: .standard, viewModel: VideoView.ViewModel())),
            section1: .init(cellViewModel: .init(insets: .standard, viewModel: details)),
            section2: .init(cellViewModel: .init(insets: .standard, viewModel: UILabel.ViewModel(color: .white, font: .inter(size: 16)))),
            section3: .init(cellsViewModels: tutorialSteps.correctlyNumbered.map { .init(insets: .standard, viewModel: $0) })
        )
        return detailsViewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableContainer.inject(view: tableView)
        tableView.addGradient(toTop: 0.05)
    }
}
