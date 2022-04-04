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
            print(deepLink?.card as Any)
            // If the api doesn't respond or this is not connected to the internet, then
            // read the url and fall back on local json data, and omit the artist information because
            // you are not connected to the internet.
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
        readerVC.completionBlock = { print($0 as Any) }
        readerVC.modalPresentationStyle = .formSheet
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        present(readerVC, animated: true)
    }
}
