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
///  Good Tarot info:
///  https://en.wikipedia.org/wiki/Minor_Arcana
///  https://www.tarotcardmeanings.net/tarot-playingcards.htm
class ViewController: UIViewController, QRCodeReaderViewControllerDelegate {

    let localCards: Cards = Bundle.localCards

    lazy var readerVC: QRCodeReaderViewController = {
        let builder = QRCodeReaderViewControllerBuilder {
            $0.reader = QRCodeReader(metadataObjectTypes: [.qr], captureDevicePosition: .back)
        }
        return QRCodeReaderViewController(builder: builder)
    }()

    func reader(_ reader: QRCodeReaderViewController, didScanResult result: QRCodeReaderResult) {
        guard let card = localCards.card(from: result.value) else { return }
        DispatchQueue.main.async { [weak self] in
            self?.navigationController?.pushViewController(CardDetailViewController.instantiat(card: card), animated: true)
        }
        // if internet is not connected.  -->
//        result.value.url?.callCodable { [weak self] (deepLink: DeeplinkPayload?) in
//            // if web call fails {
//            //    parse the url to get the information, instead of getting the data from the backend, When we are using the
//
//            guard let key = deepLink?.cardKey,
//                  let card = self?.localCards.card(from: key) else {
//                      print("failed")
//                      return
//                  }
//            DispatchQueue.main.async {
//                self?.navigationController?.pushViewController(CardDetailViewController.instantiat(card: card), animated: true)
//            }
//            print(card as Any)
//        }
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
