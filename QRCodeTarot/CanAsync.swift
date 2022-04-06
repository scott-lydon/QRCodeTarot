//
//  CanAsync.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 4/6/22.
//

import Foundation

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
