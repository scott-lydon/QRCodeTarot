//
//  AppDelegate.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 4/3/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var timeTracker: TimeChangeListener?

    func applicationSignificantTimeChange(_ application: UIApplication) {
        timeTracker?.timeChanged()
    }
}

protocol TimeChangeListener {
    func timeChanged()
}
