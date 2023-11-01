//
//  ViewModelCollectionViewCell.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 5/4/22.
//

// MARK: - This is a generic reusable cell that makes view models easier to work with.
// I used this pattern before SwiftUI was available.  But now prefer swiftui.  

import TableMVVM
import UIKit

/// Purpose: Sometimes developers may be tempted to design a view integrated with a `UITableViewCell`
/// This becomes problematic when you need to use that view separately.  So then you either duplicate the code
/// or have to refactor out the view from the cell so that it can be used separately from a `UITableViewCell`
/// and as a subview to a `UItableviewCell`.
///
/// ViewModelCell automatically lets you inject a view into a TableViewCell
public class ViewModelCollectionCell<View: UIView>: UICollectionViewCell, HasViewModel
where View: HasViewModel,
      View.ViewModel: HasFallBack {
    var view: View = .init(frame: .zero)

    /// This is used as a reuse identifier when dequeueing the cell.
    override public class var className: String {
        View.className
    }

    public typealias ViewModel = View.ViewModel

    public var viewModel: ViewModel = .fallBack {
        didSet {
            contentView.inject(view: view)
            view.viewModel = viewModel
        }
    }
}
