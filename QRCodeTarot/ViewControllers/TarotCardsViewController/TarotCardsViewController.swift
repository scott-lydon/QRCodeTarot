//
//  TarotCardsViewController.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 5/13/22.
//

import UIKit


class TarotCardsViewController: UIViewController {

    @IBOutlet var collectionView: UICollectionView!

    var cards: [Card] = []

    static func instantiate(with cards: [Card]) -> TarotCardsViewController {
        let TarotCardsViewController: TarotCardsViewController = UIStoryboard.vc()!//ut
        TarotCardsViewController.loadView()
        TarotCardsViewController.view.set(background: BackgroundView.zero)
        TarotCardsViewController.collectionView.delegate = TarotCardsViewController
        TarotCardsViewController.collectionView.dataSource = TarotCardsViewController
        TarotCardsViewController.collectionView.register(ChoiceCell.self, forCellWithReuseIdentifier: ChoiceCell.className)
        TarotCardsViewController.title = "Tarot Cards"
        TarotCardsViewController.cards = cards
        return TarotCardsViewController
    }
}

extension TarotCardsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        collectionView.dequeueCell(
            for: indexPath,
               cell: ChoiceCell(),
               viewModel: cards[indexPath.row].choiceViewModel
        )
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cards.count
    }
}

extension TarotCardsViewController: UICollectionViewDelegateFlowLayout {

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
        navigationController?.pushViewController(
            CardDetailViewController.instantiat(card: cards[indexPath.row]),
            animated: true
        )
    }
}
