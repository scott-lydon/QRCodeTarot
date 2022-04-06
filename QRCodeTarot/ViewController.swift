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
    var dispatcher: CanAsync = DispatchQueue.main

    lazy var readerVC: QRCodeReaderViewController = {
        let builder = QRCodeReaderViewControllerBuilder {
            $0.reader = QRCodeReader(metadataObjectTypes: [.qr], captureDevicePosition: .back)
        }
        return QRCodeReaderViewController(builder: builder)
    }()

    func reader(_ reader: QRCodeReaderViewController, didScanResult result: QRCodeReaderResult) {
        didRead(translatedQRCode: result.value)
    }

    func didRead(translatedQRCode: String) {
        guard let card = localCards.card(from: translatedQRCode) else { return }
        dispatcher.async(group: nil, qos: .unspecified, flags: []) {
            [weak self] in
            self?.navigationController?.pushViewController(CardDetailViewController.instantiat(card: card), animated: true)
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
        readerVC.modalPresentationStyle = .formSheet
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        present(readerVC, animated: true)
    }
}

protocol CanAsync {
    func async(
        group: DispatchGroup?,
        qos: DispatchQoS,
        flags: DispatchWorkItemFlags,
        execute work: @escaping @convention(block) () -> Void
    )
}

extension DispatchQueue: CanAsync {}

class MockCanAsync: CanAsync {

    func async(
        group: DispatchGroup? = nil,
        qos: DispatchQoS = .unspecified,
        flags: DispatchWorkItemFlags = [],
        execute work: @escaping @convention(block) () -> Void
    ) {
        work()
    }
}
