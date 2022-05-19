//
//  DetailsViewController.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 4/15/22.
//

import UIKit
import TableMVVM

typealias DetailDataSource = TableDataSource3<
    SectionNoHeader<ViewModelCell<VideoView>>,
    SectionNoHeader<ViewModelCell<LabelLabel>>,
    Section<
        HeaderFooter<UILabel>,
        ViewModelCell<TutorialStepView>
    >
>

extension UILabel: HasViewModel {

    public var viewModel: ViewModel {
        get {
            return .init(color: tintColor, font: font)
        }
        set {
            textColor = newValue.color
            font = newValue.font
        }
    }

    public struct ViewModel: HasFallBack {
        var color: UIColor = .white
        var font: UIFont = UIFont.inter(size: 16)

        public static var fallBack: UILabel.ViewModel {
            .init()
        }
    }
}

/// This is the tutorial view controller, needs a total revamp. 
class DetailsViewController: UIViewController {

//    var dataSource: DetailDataSource = .init() {
//        didSet {
//            tableView.viewModel = dataSource
//        }
//    }
//
//    lazy var tableView: UITableMVVM<DetailDataSource> = {
//        UITableMVVM(viewModel: dataSource).asClear()
//    }()

    static func instantiate(
    //    with viewModels: [DynamicDetailView.ViewModel]
    ) -> DetailsViewController {
        let detailsViewController: DetailsViewController = UIStoryboard.vc()!
//        detailsViewController.dataSource = .init(
//            section0: .init(cellsViewModels: viewModels, cellTapped: nil)
//        )
        return detailsViewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
     //   view.inject(view: tableView)
    }
}
