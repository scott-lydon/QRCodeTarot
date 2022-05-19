//
//  UITableView.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 5/18/22.
//

import UIKit

extension UITableView {

    func hasRowAtIndexPath(indexPath: IndexPath) -> Bool {
        indexPath.section < self.numberOfSections && indexPath.row < self.numberOfRows(inSection: indexPath.section)
    }

    func indices(inSection section: Int) -> [IndexPath] {
        let rowcount = numberOfRows(inSection: section)
        guard rowcount > 0 else { return [] }
        return (0..<rowcount).map { IndexPath(row: $0, section: section)}
    }
}
