//
//  QRViewControllerTests.swift
//  QRCodeTarotTests
//
//  Created by Scott Lydon on 4/5/22.
//

import XCTest
@testable import QRCodeTarot

class ViewControllerTests: XCTestCase {

    /*
     func reader(_ reader: QRCodeReaderViewController, didScanResult result: QRCodeReaderResult) {
         guard let card = localCards.card(from: result.value) else { return }
         DispatchQueue.main.async { [weak self] in
             self?.navigationController?.pushViewController(CardDetailViewController.instantiat(card: card), animated: true)
         }
         dismiss(animated: true)
     }

     func readerDidCancel(_ reader: QRCodeReaderViewController) {
         reader.stopScanning()
         dismiss(animated: true)
     }
     */

    func testViewControllerReader() {
        guard let viewController = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "ViewController") as? ViewController else {
            XCTFail()
            return
        }
        let QRCodeReaderViewController
        viewController.reader(<#T##reader: QRCodeReaderViewController##QRCodeReaderViewController#>, didScanResult: <#T##QRCodeReaderResult#>)
    }
}
