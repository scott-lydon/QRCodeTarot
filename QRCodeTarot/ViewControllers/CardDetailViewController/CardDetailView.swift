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
    
    @State var card: Card
    
    @State var readMoreShow: Bool = true
    @State var switchmodel: TarotSwitchView.ViewModel = .fallBack
    @State var evolved: Int = 0
    
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
                        Text(card.name.capitalized)
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .padding(.bottom, 30)
                        Image(uiImage: card.image!)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 200)
                            .cornerRadius(15.0)
                            .padding(.bottom, 20)
                        HStack {
                            Text("Description")
                                .font(.title)
                                .foregroundColor(.white)
                            Spacer()
                        }
                        .padding(.bottom, 5)
                        Text(card.desc)
                            .lineLimit(readMoreShow ? 4 : nil)
                            .font(ui: .inter(size: 17).dynamic)
                            .lineSpacing(6.0)
                            .foregroundColor(Color(uiColor: .gentleText))
                            .padding(.bottom, 20)
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
                        Color.gray
                            .frame(height: 1)
                            .padding(.top, 15)
                        
                        SegmentedPicker(
                            items: ["Evolved", "Unevolved"],
                            minHeight: 50,
                            selection: $evolved
                        )
                        .padding([.top, .bottom])
                        HStack {
                            Text(evolved == 0 ? "Evolved" : "Unevolved")
                                .font(.title)
                                .foregroundColor(.white)
                            Spacer()
                        }
                        .padding(.bottom, 5)
                        Text(evolved == 0 ? card.evolved! : card.unevolved!)
                            .lineSpacing(6.0)
                            .font(ui: .inter(size: 17).dynamic)
                            .foregroundColor(Color(uiColor: .gentleText))
                    }
                    .padding([.leading, .trailing], 25)
                }
            }
        }
    }
}

struct CardDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CardDetailView(card: .random)
            .allPreviews()
    }
}


extension View {
    
    @inlinable public func font(ui: UIFont) -> some View {
        font(Font(uiFont: ui))
    }
    
    @inlinable func allPreviews() -> some View {
        Group {
            previewDevice("iPhone 14 Pro Max")
            previewInterfaceOrientation(.landscapeLeft)
                .previewDevice("iPhone 14 Pro Max")
            previewInterfaceOrientation(.portrait)
                .previewDevice("iPhone SE (3rd generation)")
            previewInterfaceOrientation(.landscapeLeft)
                .previewDevice("iPhone SE (3rd generation)")
        }
    }
}

public extension Font {
    init(uiFont: UIFont) {
        self = Font(uiFont as CTFont)
    }
}
