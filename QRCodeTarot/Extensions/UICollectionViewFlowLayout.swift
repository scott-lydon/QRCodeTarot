//
//  UICollectionViewFlowLayout.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 5/4/22.
//

import UIKit

extension UICollectionViewFlowLayout {
    
    var leftRightAndInteritem: CGFloat {
        minimumInteritemSpacing + sectionInset.left + sectionInset.right
    }
}
