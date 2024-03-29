//
//  CustomSegmentedControl.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 9/24/22.
//
import SwiftUI

extension View {
    func eraseToAnyView() -> AnyView {
        AnyView(self)
    }
}

struct SizePreferenceKey: PreferenceKey {
    typealias Value = CGSize
    static var defaultValue: CGSize = .zero
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
        value = nextValue()
    }
}
struct BackgroundGeometryReader: View {
    var body: some View {
        GeometryReader { geometry in
            Color
                    .clear
                    .preference(key: SizePreferenceKey.self, value: geometry.size)
        }
    }
}
struct SizeAwareViewModifier: ViewModifier {
    @Binding private var viewSize: CGSize

    init(viewSize: Binding<CGSize>) {
        self._viewSize = viewSize
    }

    func body(content: Content) -> some View {
        content
            .background(BackgroundGeometryReader())
            .onPreferenceChange(SizePreferenceKey.self, perform: { if self.viewSize != $0 { self.viewSize = $0 } })
    }
}

struct PillColors {
    var foreground: UIColor
    var background: UIColor

    static var selection: Self {
        .init(foreground: .black, background: .nearWhite)
    }

    static var background: Self {
        .init(foreground: .deselectedGray, background: .darkBackground)
    }
}

struct SegmentedPicker: View {
    private let ActiveSegmentColor: Color// = Color(.tertiarySystemBackground) // pill color
    private let BackgroundColor: Color// = Color(.secondarySystemBackground)
    private let ShadowColor = Color.black.opacity(0.2)
    private let TextColor: Color // = Color(.secondaryLabel)
    private let SelectedTextColor: Color //  = Color(.label)

    private static let TextFont: Font = .system(size: 12)

    private static let SegmentCornerRadius: CGFloat = 12
    private static let ShadowRadius: CGFloat = 4
    private static let SegmentXPadding: CGFloat = 16
    private static let SegmentYPadding: CGFloat = 8
    private static let PickerPadding: CGFloat = 4

    private static let AnimationDuration: Double = 0.35

    // Stores the size of a segment, used to create the active segment rect
    @State private var segmentSize: CGSize = .zero
    let height: CGFloat
    // Rounded rectangle to denote active segment
    private var activeSegmentView: AnyView {
        // Don't show the active segment until we have initialized the view
        // This is required for `.animation()` to display properly, otherwise the animation will fire on init
        let isInitialized: Bool = segmentSize != .zero
        if !isInitialized { return EmptyView().eraseToAnyView() }
        return
            RoundedRectangle(cornerRadius: Self.SegmentCornerRadius)
                .foregroundColor(ActiveSegmentColor)
                .shadow(color: ShadowColor, radius: Self.ShadowRadius)
                .frame(width: self.segmentSize.width, height: height)
                .offset(x: self.horizontalOffset(), y: 0)
               // .animation(.linear, value: SegmentedPicker.AnimationDuration) // doesn't animate.
               // .animation(Animation.linear(duration: SegmentedPicker.AnimationDuration))
                .animation(Animation.spring(blendDuration: Self.AnimationDuration))
                .eraseToAnyView()
    }

    @Binding private var selection: Int
    private let items: [String]

    init(
        items: [String],
        minHeight: CGFloat,
        selection: Binding<Int>,
        selectionPill: PillColors = .selection,
        backgroundPill: PillColors = PillColors.background
    ) {
        self._selection = selection
        self.items = items
        self.height = minHeight
        self.ActiveSegmentColor = Color(selectionPill.background) // pill color
        self.SelectedTextColor = Color(selectionPill.foreground)
        self.BackgroundColor = Color(backgroundPill.background)
        self.TextColor = Color(backgroundPill.foreground)
    }

    var body: some View {
        // Align the ZStack to the leading edge to make calculating offset on activeSegmentView easier
        ZStack(alignment: .leading) {
            // activeSegmentView indicates the current selection
            self.activeSegmentView
            HStack {
                ForEach(0..<self.items.count, id: \.self) { index in
                    self.getSegmentView(for: index)
                }
            }
        }
        .padding(Self.PickerPadding)
        .background(BackgroundColor)
        .clipShape(RoundedRectangle(cornerRadius: Self.SegmentCornerRadius))
    }

    // Helper method to compute the offset based on the selected index
    private func horizontalOffset() -> CGFloat {
        CGFloat(self.selection) * (self.segmentSize.width + Self.SegmentXPadding / 2)
    }

    // Gets text view for the segment
    private func getSegmentView(for index: Int) -> some View {
        guard index < self.items.count else {
            return EmptyView().eraseToAnyView()
        }
        let isSelected = self.selection == index
        return
            Text(self.items[index])
                // Dark test for selected segment
                .foregroundColor(isSelected ? SelectedTextColor : TextColor)
                .lineLimit(1)
                .padding(.vertical, Self.SegmentYPadding)
                .padding(.horizontal, Self.SegmentXPadding)
                .frame(minWidth: 0, maxWidth: .infinity)
                // Watch for the size of the
                .modifier(SizeAwareViewModifier(viewSize: self.$segmentSize))
                .onTapGesture { self.onItemTap(index: index) }
                .eraseToAnyView()
    }

    // On tap to change the selection
    private func onItemTap(index: Int) {
        guard index < self.items.count else {
            return
        }
        self.selection = index
    }
}

struct PreviewView: View {
    @State var selection: Int = 0
    private let items: [String] = ["M", "T", "W", "T", "F"]

    var body: some View {
        SegmentedPicker(items: self.items, minHeight: 100, selection: self.$selection)
            .padding()
    }
}
