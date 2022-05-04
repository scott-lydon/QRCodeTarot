//
//  DynamicDetailView.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 4/15/22.
//

import UIKit
import TableMVVM

class DynamicDetailView: NibView, HasViewModel {

    var viewModel: ViewModel = .fallBack {
        didSet {
            switch viewModel {
            case .imageLabel(let imageLabelViewModel):
                injectRecyclable(viewModel: imageLabelViewModel, unused: ImageLabel())
            case .image(let image):
                injectRecyclable(viewModel: image, unused: ImageContainer())
            case .labelImage(let labelImageViewModel):
                injectRecyclable(viewModel: labelImageViewModel, unused: LabelImage())
            }
        }
    }
}

extension UIView {
    
    func injectRecyclable<T: UIView>(viewModel: T.ViewModel, unused: T = .init()) where T: HasViewModel {
        if var t: T = subviews.firstOfType() {
            t.viewModel = viewModel
        } else {
            subviews.forEach { $0.removeFromSuperview() }
            inject(view: T(viewModel: viewModel))
        }
    }
}

extension DynamicDetailView {

    enum ViewModel: HasFallBack {

        case imageLabel(ImageLabel.ViewModel)
        case image(ImageContainer.ViewModel)
        case labelImage(LabelImage.ViewModel)

        static var fallBack: DynamicDetailView.ViewModel {
            .imageLabel(.init(image: .init(), text: ""))
        }
    }
}

extension Array where Element == DynamicDetailView.ViewModel {
    
    static func models(from tutorial: String) -> Self {
        if tutorial == "magic trick 1" {
            return [
                .imageLabel(
                    ImageLabel.ViewModel(
                        image: .hambugerMenu,
                        text: "baslkj dflkj alsdkjf lkj asldkfj alskdjf laksj dflkja sdlfkj aslkdjf"
                    )
                ),
                .image(.hambugerMenu),
                .labelImage(
                    LabelImage.ViewModel(
                        image: .hambugerMenu,
                        text: "lkjlkjslkdjflkj lkj slkdjf lkj lkj lkj lkj sdfsdlfkjlksj"
                    )
                ),
                .image(.hambugerMenu)
            ]
        } else if tutorial == "magic trick 2" {
            return [
                .imageLabel(
                    ImageLabel.ViewModel(
                        image: .hambugerMenu,
                        text: "lkj lkj lkjlkjlkjl kj lkjlkj lkj lkj lkj lkj lkjsdflkj"
                    )
                ),
                .image(.hambugerMenu),
                .image(.hambugerMenu),
                .image(.hambugerMenu),
                .labelImage(
                    LabelImage.ViewModel(
                        image: .hambugerMenu,
                        text: "lkjlkj lkj lkj lkj lkjlklkjlk jlkj lkjlkjlkj lkjsdf lkj"
                    )
                ),
                .image(.hambugerMenu)
            ]
        }
        return []
    }
}
