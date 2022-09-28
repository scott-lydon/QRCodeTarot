//
//  TarotCardsViewController.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 5/13/22.
//

import UIKit
import SwiftUI

/// Directly from Menu View Controller, shows a collection of tarot cards (not details).
/// This is the Tarot card menu.  
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
        TarotCardsViewController.viewDidLoad()
        return TarotCardsViewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.addGradient(toTop: 0.05)
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
        collectionView.gridCellSize(perRow: 2)
    }

    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
        navigationController?.pushViewController(
            UIHostingController(rootView: CardDetailView(card: cards[indexPath.row])),
            // CardDetailViewController.instantiate(payload: cards[indexPath.row]),
            animated: true
        )
    }
}
