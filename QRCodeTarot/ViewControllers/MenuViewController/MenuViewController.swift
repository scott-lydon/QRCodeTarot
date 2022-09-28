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

    var menuItems: [MenuItem] = MenuItem.allCases

    @IBOutlet var stackTop: NSLayoutConstraint!
    @IBOutlet var stackBottom: NSLayoutConstraint!

    static func instantiate() -> MenuViewController {
        let menuViewController: MenuViewController = UIStoryboard.vc()!
        menuViewController.loadView()
        menuViewController.view.set(background: BackgroundView.zero)
        menuViewController.collectionView.delegate = menuViewController
        menuViewController.collectionView.dataSource = menuViewController
        menuViewController.collectionView.register(ChoiceCell.self, forCellWithReuseIdentifier: ChoiceCell.className)
        menuViewController.greetingLabel.text = Date().greeting
        DispatchQueue.main.async {
            (UIApplication.shared.delegate as? AppDelegate)?.timeTracker = menuViewController
        }
        menuViewController.viewDidLoad()
        return menuViewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.backBarButtonItem = .init(title: "", style: .plain, target: nil, action: nil)
        if UIScreen.main.bounds.height < 600 {
            stackTop.constant = 10
            stackBottom.constant = 10
        }
    }

    deinit {
        DispatchQueue.main.async {
            (UIApplication.shared.delegate as? AppDelegate)?.timeTracker = nil
        }
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
               viewModel: menuItems[indexPath.row].choiceViewModel
        )
    }

    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        menuItems.count
    }
}

extension MenuViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        collectionView.gridCellSize(perRow: 2)
    }

    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
        switch menuItems[indexPath.row] {
        case .tarotQRReader:
            navigationController?.popToFirstOf(type: QrReaderViewcontroller())
        case .activity(let activity):
            navigationController?.pushViewController(
                SubMenuViewController.instantiate(with: activity),
                animated: true
            )
        case .tarotCards(let cards):
            navigationController?.pushViewController(
                TarotCardsViewController.instantiate(with: cards),
                animated: true
            )
        }
    }
}
