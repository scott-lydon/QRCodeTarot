//
//  MenuViewController.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 4/14/22.
//

import UIKit
import TableMVVM

class MenuViewController: UIViewController {

    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var greetingLabel: UILabel!

    var activities: [Activity] = Activity.allCases

    static func instantiate() -> MenuViewController {
        let menuViewController: MenuViewController = UIStoryboard.vc()!
        menuViewController.loadView()
        menuViewController.view.set(background: BackgroundView.zero)
        menuViewController.collectionView.delegate = menuViewController
        menuViewController.collectionView.dataSource = menuViewController
        menuViewController.collectionView.register(ChoiceCell.self, forCellWithReuseIdentifier: ChoiceCell.className)
        menuViewController.greetingLabel.text = Date().greeting
        (UIApplication.shared.delegate as? AppDelegate)?.timeTracker = menuViewController
        menuViewController.title = "Menu"
        return menuViewController
    }
}

extension MenuViewController: TimeChangeListener {

    func timeChanged() {
        greetingLabel.text = Date().greeting
    }
}

typealias ChoiceCell = ViewModelCollectionCell<ChoiceView>

extension MenuViewController: UICollectionViewDataSource {

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        collectionView.dequeueCell(
            for: indexPath,
               cell: ChoiceCell(),
               viewModel: activities[indexPath.row].choiceViewModel
        )
    }

    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        activities.count
    }
}

extension MenuViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        collectionView.width
            .minus(collectionViewLayout.asFlowLayout?.leftRightAndInteritem ?? 0)
            .divided(by: 2)
            .square
    }

    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
        switch activities[indexPath.row] {
        case .tarotQRReader:
            navigationController?.popToFirstOf(type: QrReaderViewcontroller())
        default:
            navigationController?.pushViewController(
                SubMenuViewController.instantiate(with: activities[indexPath.row]),
                animated: true
            )
        }        
    }
}
