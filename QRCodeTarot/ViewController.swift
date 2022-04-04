//
//  ViewController.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 4/3/22.
//

import UIKit
import AVFoundation
import QRCodeReader

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


struct Card {
    let symbol: Symbol
    let number: Int
    let deckVersion: Int
}
