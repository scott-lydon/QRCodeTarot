//
//  SimpleTextCell.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 4/14/22.
//

import UIKit
import TableMVVM

class SimpleTextCell: NibView, HasViewModel {

    var viewModel: String = "" {
        didSet {
            label.text = viewModel
        }
    }

    typealias ViewModel = String

    @IBOutlet var label: UILabel!
}

extension String: HasFallBack {
    public static var fallBack: String { "" }
}
