//
//  HasPayload.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 9/23/22.
//

import UIKit

protocol HasPayload: UIViewController {
    associatedtype Payload
    var payload: Payload! { get set }
}

extension HasPayload {
    static func instantiate(payload: Payload) -> Self {
        let viewController: Self = UIStoryboard.vc()!
        viewController.payload = payload
        return viewController
    }
}
