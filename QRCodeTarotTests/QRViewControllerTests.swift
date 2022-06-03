//
//  QRViewControllerTests.swift
//  QRCodeTarotTests
//
//  Created by Scott Lydon on 4/5/22.
//

import XCTest
import QRCodeReader
@testable import QRCodeTarot

class ViewControllerTests: XCTestCase {

    func testViewControllerReader() {
        let navigationController = UINavigationController()
        
        guard let viewController = UIStoryboard(name: "Main", bundle: .main)
                .instantiateViewController(withIdentifier: "ViewController") as? QrReaderViewcontroller else {
                    XCTFail()
                    return
                }

        navigationController.pushViewController(viewController, animated: false)
        viewController.dispatcher = MockCanAsync()
        viewController.didRead(translatedQRCode: "/3/hearts/1")
        XCTAssertNotNil(viewController.navigationController)
        XCTAssertNotNil(viewController.navigationController?.viewControllers.last)
        viewController.readerDidCancel(viewController.readerVC)
        viewController.didRead(translatedQRCode: "")
    }

    func testCardKeyCases() {
        XCTAssertEqual(CardKey.Symbol.clubs.suit, .wands)
        XCTAssertEqual(CardKey.Symbol.spades.suit, .swords)
        XCTAssertEqual(CardKey.Symbol.diamonds.suit, .pentacles)
    }
}
