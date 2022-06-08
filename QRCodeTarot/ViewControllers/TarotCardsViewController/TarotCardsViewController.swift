//
//  TarotCardsViewController.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 5/13/22.
//

import UIKit

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

extension UIView {
    func addGradient(toTop: NSNumber = 0.05) {
        let gradient = CAGradientLayer()
        gradient.frame = superview?.bounds
            .increasedWidth(by: 50) // idk why, but this prevents the chop off on the right side issue.
        ?? CGRect.null
        gradient.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradient.locations = [0.0, toTop]
        superview?.layer.mask = gradient
    }
}

extension CGRect {
    func increasedWidth(by amount: CGFloat) -> CGRect {
        .init(x: self.minX, y: self.minY, width: self.width + amount, height: self.height)
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
            CardDetailViewController.instantiate(card: cards[indexPath.row]),
            animated: true
        )
    }
}
