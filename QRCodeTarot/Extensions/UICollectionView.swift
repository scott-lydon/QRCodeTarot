
//
//  UICollectionView.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 5/4/22.
//

import UIKit
import TableMVVM

extension UICollectionView {

    /// Convenience function for reloading data on the main thread.
    /// - Parameter queue: defualt is main.
    public func reload(on queue: DispatchQueueType = DispatchQueue.main) {
        queue.async { self.reloadData() }
    }

    /// dequeues a cell of the type matching the cell argument's type, and assigns a view model to that cell.
    /// - Parameters:
    ///   - indexPath: indexpath of the cell
    ///   - cell: An argument only provided for the purpose to assist Swift's generic type inference.
    ///   - viewModel: The view model to be assigned to the cell.
    /// - Returns: returns a `UITableViewCell`
    public func dequeueCell<T: UICollectionViewCell>(
        for indexPath: IndexPath, cell: T, viewModel: T.ViewModel?) -> T
    where T: HasViewModel {
        guard var cell = dequeueReusableCell(withReuseIdentifier: T.className, for: indexPath) as? T,
              let viewModel = viewModel else { return .init() }
        cell.viewModel = viewModel
        return cell
    }

    var width: CGFloat {
        frame.size.width
    }
     
     func gridCellSize(perRow count: Int) -> CGSize {
         width
             .minus(collectionViewLayout.asFlowLayout?.leftRightAndInteritem ?? 0)
             .divided(by: count.cgFloat)
             .rounded(.down)
             .square
     }
}
