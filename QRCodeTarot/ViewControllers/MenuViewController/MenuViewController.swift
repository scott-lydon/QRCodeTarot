//
//  MenuViewController.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 4/14/22.
//

import ARKit
import TableMVVM
import UIKit

class MenuViewController: UIViewController {
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var greetingLabel: UILabel!

    var menuItems: [MenuItem] = MenuItem.allCases

    @IBOutlet var stackTop: NSLayoutConstraint!
    @IBOutlet var stackBottom: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.set(background: BackgroundView.zero)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ChoiceCell.self, forCellWithReuseIdentifier: ChoiceCell.className)
        greetingLabel.text = Date().greeting
        DispatchQueue.main.async {
            (UIApplication.shared.delegate as? AppDelegate)?.timeTracker = self
        }
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
            cell: ChoiceCell.self,
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
            guard let tarotViewController: TarotRecognizerViewController = UIStoryboard.vc() else { return }
            navigationController?.pushViewController(tarotViewController, animated: true)

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
