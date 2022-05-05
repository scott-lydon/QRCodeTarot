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

    var choiceViewModels: [ChoiceView.ViewModel] = [
        .init(text: "Magic Tricks", image: .magicHat),
        .init(text: "Games", image: .gameController),
        .init(text: "Tarot Cards", image: .gameCards),
        .init(text: "Tarot QR Reader", image: .qrCode)
    ]

    static func instantiate() -> MenuViewController {
        let menuViewController: MenuViewController = UIStoryboard.vc()!
        menuViewController.loadView()
        let backgroundView = BackgroundView(frame: .zero)
        menuViewController.view.insertSubview(backgroundView, at: 0)
        menuViewController.view.pinToEdges(view: backgroundView)
        menuViewController.collectionView.delegate = menuViewController
        menuViewController.collectionView.dataSource = menuViewController
        menuViewController.collectionView.register(ChoiceCell.self, forCellWithReuseIdentifier: ChoiceCell.className)
        return menuViewController
    }
}

typealias ChoiceCell = ViewModelCollectionCell<ChoiceView>

extension MenuViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: ChoiceCell = collectionView.dequeueCell(for: indexPath, cell: ChoiceCell(), viewModel: choiceViewModels[indexPath.row])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        choiceViewModels.count
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

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let choiceText = Row(rawValue: choiceViewModels[indexPath.row].text) else { return }
        let nextViewController: UIViewController
        switch choiceText {
        case .tutorialRows(let subMenu):
            nextViewController = SubMenuViewController.instantiate(with: subMenu)
        case .tarotQRReader:
            navigationController?.popToFirstOf(type: QRREaderViewcontroller())
            return
        case .contact:
            nextViewController = ContactViewController.instantiate()
        }
        navigationController?.pushViewController(nextViewController, animated: true)
    }
}
