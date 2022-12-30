//
//  HasViewModelAdapter.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 9/23/22.
//

import SwiftUI
import TableMVVM

struct HasViewmodelAdapter<View: UIView>: UIViewRepresentable where View: HasViewModel {
    @Binding var viewModel: View.ViewModel

    func makeUIView(context: Context) -> some UIView {
        var view = View.zero
        view.viewModel = viewModel
        return view
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {
        guard var buffer = (uiView as? View) else {
            assertionFailure("uiview wasn't the corresponding: \(View.className)")
            return
        }
        buffer.viewModel = viewModel
    }
}
