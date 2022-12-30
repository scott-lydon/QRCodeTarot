//
//  ViewController.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 4/3/22.
//

import AVFoundation
import Callable
import QRCodeReader
import UIKit

class QRREaderViewcontroller: UIViewController, QRCodeReaderViewControllerDelegate {
    let localCards: Cards = Bundle.localCards
    var dispatcher: CanAsync = DispatchQueue.main

    lazy var readerVC: QRCodeReaderViewController = {
        QRCodeReaderViewController(
            builder: QRCodeReaderViewControllerBuilder {
                $0.reader = QRCodeReader(metadataObjectTypes: [.qr], captureDevicePosition: .back)
            }
        )
    }()

    func reader(_ reader: QRCodeReaderViewController, didScanResult result: QRCodeReaderResult) {
        didRead(translatedQRCode: result.value)
    }

    func didRead(translatedQRCode: String) {
        guard let card = localCards.tarotCard(from: translatedQRCode) else { return }
        dispatcher.async(group: nil, qos: .unspecified, flags: []) {
            [weak self] in
            self?.navigationController?.pushViewController(
                CardDetailViewController.instantiat(card: card),
                animated: true
            )
        }
        dismiss(animated: true)
    }

    func readerDidCancel(_ reader: QRCodeReaderViewController) {
        reader.stopScanning()
        menuTapped()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        readerVC.delegate = self
        readerVC.modalPresentationStyle = .formSheet
        let menuButton = UIButton(frame: .init(origin: .zero, size: CGSize(width: 50, height: 50)))
        menuButton.addTarget(self, action: #selector(menuTapped), for: .touchUpInside)
        menuButton.setImage(.hambugerMenu, for: .normal)
        menuButton.tintColor = .white
        readerVC.view.addSubview(menuButton)
    }

    @objc func menuTapped() {
        readerVC.dismiss(animated: true)
        navigationController?.pushViewController(MenuViewController.instantiate(), animated: true)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        present(readerVC, animated: true)
    }
}
