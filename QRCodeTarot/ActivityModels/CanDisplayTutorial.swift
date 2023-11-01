//
//  CanDisplayTutorial.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 5/12/22.
//

import Foundation

typealias CanDisplayTutorial = HasTitle & HasSubTitle & HasSummary// & HasTutorial

protocol HasTitle {
    var title: String { get }
}

protocol HasSubTitle {
    var subTitle: String { get }
}

protocol HasSummary {
    var summary: String? { get }
}
