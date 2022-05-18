//
//  VideoView.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 5/17/22.
//

import UIKit
import TableMVVM

class VideoView: NibView, HasViewModel {


    var viewModel: ViewModel = .init() {
        didSet {
            
        }
    }
}

extension VideoView {
    struct ViewModel: HasFallBack {
        static var fallBack: VideoView.ViewModel {
            .init()
        }


    }
}
