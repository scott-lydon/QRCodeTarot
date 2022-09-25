//
//  NSMutableAttributedString.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 9/23/22.
//

import UIKit

extension NSMutableAttributedString {
    
    static var readMore: NSMutableAttributedString {
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = UIImage.chevronRight.withTintColor(.white)
        let fullString = NSMutableAttributedString(string: "Read More ")
        fullString.append(NSAttributedString(attachment: imageAttachment))
        fullString.set(color: .white)
        return fullString
    }
}
