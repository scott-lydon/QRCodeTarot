//
//  CollapsableLabelLabelAdapter.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 9/23/22.
//

import SwiftUI


struct CollapsableLabelLabelAdapter: UIViewRepresentable {
    
    @Binding var viewModel: CollapsableLabelLabel.ViewModel
    
    func makeUIView(context: Context) -> some UIView {
        let view = CollapsableLabelLabel.zero
        view.viewModel = .fallBack
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        (uiView as? CollapsableLabelLabel)?.viewModel = viewModel
    }
}
