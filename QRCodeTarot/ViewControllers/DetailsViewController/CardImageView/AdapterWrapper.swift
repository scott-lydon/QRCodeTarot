//
//  CardViewWithImage.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 9/23/22.
//

import SwiftUI

struct AdapterWrapper: View {
    @State var viewModel: CollapsableLabelLabel.ViewModel = .init(
        labelLabelViewModel: LabelLabel.ViewModel(
            topText: "Hello",
            bottomText: .lorem
        )
    )

    var body: some View {
        CollapsableLabelLabelAdapter(viewModel: $viewModel)
            .background(Color.black)
    }
}

struct AdapterWrapper_Previews: PreviewProvider {
    static var previews: some View {
        AdapterWrapper()
    }
}
