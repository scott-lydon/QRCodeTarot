//
//  DetailsViewController.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 4/15/22.
//

import UIKit
import TableMVVM

typealias DetailDataSource = TableDataSource1<
    Section<
        HeaderFooter<SimpleTextCell>,
        ViewModelCell<DynamicDetailView>
    >
>

class DetailsViewController: UIViewController {

    var tutorial: String = ""

    var dataSource: DetailDataSource = .init() {
        didSet {
            tableView.viewModel = dataSource
        }
    }

    lazy var tableView: UITableMVVM = {
        UITableMVVM(viewModel: dataSource)
    }()

    static func instantiate(with tutorial: String) -> DetailsViewController {
        let detailsViewController: DetailsViewController = UIStoryboard.vc()!
        detailsViewController.tutorial = tutorial
        return detailsViewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.inject(view: tableView)
        let viewModels: [DynamicDetailView.ViewModel] = .models(from: tutorial)
        dataSource.section0.cellsViewModels = viewModels
    }
}
