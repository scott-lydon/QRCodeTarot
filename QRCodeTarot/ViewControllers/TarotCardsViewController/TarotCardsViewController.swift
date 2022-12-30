//
//  TarotCardsViewController.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 5/13/22.
//

import SwiftUI
import UIKit

/// Directly from Menu View Controller, shows a collection of tarot cards (not details).
/// This is the Tarot card menu.  
class TarotCardsViewController: UIViewController {
    @IBOutlet var collectionView: UICollectionView!

    var cards: [Card] = []

    static func instantiate(with cards: [Card]) -> TarotCardsViewController {
        let tarotCardsViewController: TarotCardsViewController = UIStoryboard.vc()! // ut
        tarotCardsViewController.loadView()
        tarotCardsViewController.view.set(background: BackgroundView.zero)
        tarotCardsViewController.collectionView.delegate = tarotCardsViewController
        tarotCardsViewController.collectionView.dataSource = tarotCardsViewController
        tarotCardsViewController.collectionView.register(ChoiceCell.self, forCellWithReuseIdentifier: ChoiceCell.className)
        tarotCardsViewController.title = "Tarot Cards"
        tarotCardsViewController.cards = cards
        tarotCardsViewController.viewDidLoad()
        return tarotCardsViewController
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
            cell: ChoiceCell.self,
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
