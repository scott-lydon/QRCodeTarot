//
//  ViewController.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 4/3/22.
//

import UIKit
import AVFoundation
import QRCodeReader
import Callable

/// We couldn't use a URL Scheme or the iphone camera to deep link to the
///  app because it automatically plugs in the address in safari.
///  https://stackoverflow.com/questions/71731173/how-to-make-the-iphone-camera-read-a-qr-code-and-go-to-my-app-instead-of-safari?noredirect=1#comment126767104_71731173
class ViewController: UIViewController, QRCodeReaderViewControllerDelegate {

    lazy var readerVC: QRCodeReaderViewController = {
        let builder = QRCodeReaderViewControllerBuilder {
            $0.reader = QRCodeReader(metadataObjectTypes: [.qr], captureDevicePosition: .back)
        }
        return QRCodeReaderViewController(builder: builder)
    }()

    func reader(_ reader: QRCodeReaderViewController, didScanResult result: QRCodeReaderResult) {
        result.value.url?.callCodable { (deepLink: DeepLink?) in
            let card = deepLink?.applinks.details.first?.paths.first
            print(card as Any)
        }
        dismiss(animated: true)
    }

    func readerDidCancel(_ reader: QRCodeReaderViewController) {
        reader.stopScanning()
        dismiss(animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        readerVC.delegate = self
        readerVC.completionBlock = { (result: QRCodeReaderResult?) in
            print(result as Any)
        }
        readerVC.modalPresentationStyle = .formSheet
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        present(readerVC, animated: true)
    }
}

extension Card {

    enum Symbol: String, Codable {
        case hearts
        case clubs
        case spades
        case diamonds
    }
}

struct Card: Codable {
    let symbol: Symbol
    let number: Int
    let deckVersion: Int
}

// MARK: - DeepLink
struct DeepLink: Codable {
    let applinks: Applinks
}

// MARK: - Applinks
struct Applinks: Codable {
    let details: [Detail]
}

// https://mocki.io/v1/74646ca2-9bce-4ad2-b623-f65f09cb3ac4 <- This can work as a QR code to show you with the internal scanner.
// MARK: - Detail
struct Detail: Codable {
    let appID: String
    let paths: [Card]
}
