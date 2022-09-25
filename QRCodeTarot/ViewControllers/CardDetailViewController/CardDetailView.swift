//
//  CardDetailView.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 9/23/22.
//

import SwiftUI

var uipadding: CGFloat = 25
var uipaddingBoth: CGFloat { uipadding * 2 }

struct CardDetailView: View {
    
    @State var viewModel: CollapsableLabelLabel.ViewModel
    @State var readMoreShow: Bool = true
    @State var switchmodel: TarotSwitchView.ViewModel
    @State var favoriteColor: Int = 0
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color.black
                    .edgesIgnoringSafeArea(.all)
                Image(.darkColorShade)
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                ScrollView {
                    VStack {
                        Text("Two of Cups".capitalized)
                            .font(.largeTitle)
                            .foregroundColor(.white)
                        Spacer(minLength: 30)
                        Image(uiImage: .cardDemo)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 200)
                            .cornerRadius(15.0)
                        Spacer(minLength: 20)
                        HStack {
                            Text("Description")
                                .font(.title)
                                .foregroundColor(.white)
                            Spacer()
                        }
                        Spacer(minLength: 10)
                        Text(String.lorem + String.lorem + String.lorem)
                            .lineLimit(readMoreShow ? 4 : nil)
                            .foregroundColor(.white)
                        Spacer(minLength: 20)
                        if readMoreShow {
                            Button {
                                readMoreShow = false
                            } label: {
                                HStack {
                                    Text("Read More ")
                                        .foregroundColor(.white)
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(.white)
                                }
                            }
                            .frame(width: geometry.size.width - uipaddingBoth, height: 50)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20.0)
                                    .stroke(.white, lineWidth: 1.0)
                            )
                        }
                        //Color.gray
//                            .frame(height: 1)
//                            .padding(.top, 15)
                    
                        Picker("What is your favorite color?", selection: $favoriteColor) {
                            Text("Evolved").tag(0)
                            Text("Unevolved").tag(1)
                        }
                        .pickerStyle(.segmented)
                        
                        
                    }
                    .padding([.leading, .trailing], 25)
                }
            }
        }
    }
}

struct CardDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CardDetailView(viewModel: .init(labelLabelViewModel: LabelLabel.ViewModel(topText: "hello", bottomText: .lorem)), switchmodel: .fallBack)
            .previewDevice("iPhone 14 Pro Max")
        
        CardDetailView(viewModel: .init(labelLabelViewModel: LabelLabel.ViewModel(topText: "hello", bottomText: .lorem)), switchmodel: .fallBack)
            .previewInterfaceOrientation(.landscapeLeft)
            .previewDevice("iPhone 14 Pro Max")
        CardDetailView(viewModel: .init(labelLabelViewModel: LabelLabel.ViewModel(topText: "hello", bottomText: .lorem)), switchmodel: .fallBack)
            .previewInterfaceOrientation(.portrait)
            .previewDevice("iPhone SE (3rd generation)")
        CardDetailView(viewModel: .init(labelLabelViewModel: LabelLabel.ViewModel(topText: "hello", bottomText: .lorem)), switchmodel: .fallBack)
            .previewInterfaceOrientation(.landscapeLeft)
            .previewDevice("iPhone SE (3rd generation)")
        
    }
}
