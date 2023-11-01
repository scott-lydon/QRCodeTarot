//
//  AppDelegate.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 4/3/22.
//

// MARK: - Standard Appdelegate, time change is added here so the app can say "Good morning, evening at the correct times.
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

typealias Action = () -> Void
