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
        guard let card = localCards.tarotCard(from: translatedQRCode) else { return }
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
