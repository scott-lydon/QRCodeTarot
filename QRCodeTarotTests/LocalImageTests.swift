//
//  LocalImageTests.swift
//  QRCodeTarotTests
//
//  Created by Scott Lydon on 5/4/22.
//

import Foundation
import XCTest
@testable import QRCodeTarot

class LocalImageTests: XCTestCase {

    func testImages() {
        XCTAssertNotNil(UIImage.star)
        XCTAssertNotNil(UIImage.qrCode)
        XCTAssertNotNil(UIImage.phone)
        XCTAssertNotNil(UIImage.magicHat)
        XCTAssertNotNil(UIImage.gameController)
        XCTAssertNotNil(UIImage.gameCards)
        XCTAssertNotNil(UIImage.darkColorShade)
        XCTAssertNotNil(UIImage.brightColorShade)
    }
}