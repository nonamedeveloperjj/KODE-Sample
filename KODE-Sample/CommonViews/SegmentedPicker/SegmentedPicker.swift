//
//  SegmentedPicker.swift
//  KODE-Sample
//
//  Created by John Snow on 05/12/2022.
//

import SwiftUI

struct SegmentedPicker<Element, Content, Selection>: View where Content: View, Selection: View {
    @State private var isScrollable = true
    @State private var backgroundFrame = CGRect.zero
    @Binding private var selectedIndex: Int

    private let elements: [Element]
    private let selection: () -> Selection
    private let content: (Element, Bool) -> Content
    private let selectionAlignment: VerticalAlignment

    init(
        _ elements: [Element],
        selectedIndex: Binding<Int>,
        selectionAlignment: VerticalAlignment = .center,
        @ViewBuilder content: @escaping (Element, Bool) -> Content,
        @ViewBuilder selection: @escaping () -> Selection
    ) {
        self.elements = elements
        self.content = content
        self.selection = selection
        self._selectedIndex = selectedIndex
        self.selectionAlignment = selectionAlignment
    }

    var body: some View {
        HStack {
            if isScrollable {
                ScrollViewReader { proxy in
                    ScrollView(.horizontal, showsIndicators: false) {
                        pickerView(scrollViewProxy: proxy)
                    }
                }
            } else {
                pickerView(scrollViewProxy: nil)
            }
        }
        .background(
            GeometryReader { proxy in
                Color.clear.onAppear {
                    backgroundFrame = proxy.frame(in: .global)
                }
            }
        )
    }
    
    private func pickerView(scrollViewProxy: ScrollViewProxy?) -> some View {
        PickerView(
            elements,
            selectedIndex: $selectedIndex,
            isScrollable: $isScrollable,
            backgroundFrame: $backgroundFrame,
            selectionAlignment: selectionAlignment,
            scrollViewProxy: scrollViewProxy,
            content: content,
            selection: selection
        )
    }
}

private struct PickerView<Element, Content, Selection>: View where Content: View, Selection: View {
    @State private var frames: [CGRect]
    @Binding private var isScrollable: Bool
    @Binding private var backgroundFrame: CGRect
    @Binding private var selectedIndex: Int

    private let elements: [Element]
    private let selection: () -> Selection
    private let content: (Element, Bool) -> Content
    private let selectionAlignment: VerticalAlignment
    private let scrollViewProxy: ScrollViewProxy?

    init(
        _ elements: [Element],
        selectedIndex: Binding<Int>,
        isScrollable: Binding<Bool>,
        backgroundFrame: Binding<CGRect>,
        selectionAlignment: VerticalAlignment,
        scrollViewProxy: ScrollViewProxy?,
        @ViewBuilder content: @escaping (Element, Bool) -> Content,
        @ViewBuilder selection: @escaping () -> Selection
    ) {
        self.elements = elements
        self.content = content
        self.selection = selection
        self._selectedIndex = selectedIndex
        self._isScrollable = isScrollable
        self._backgroundFrame = backgroundFrame
        self._frames = State(
            wrappedValue: Array(repeating: .zero, count: elements.count)
        )
        self.selectionAlignment = selectionAlignment
        self.scrollViewProxy = scrollViewProxy
    }
    
    var body: some View {
        ZStack(
            alignment: Alignment(
                horizontal: .horizontalCenterAlignment,
                vertical: selectionAlignment
            )
        ) {
            if let selectedIndex = selectedIndex {
                selection()
                    .frame(width: frames[selectedIndex].width,
                           height: frames[selectedIndex].height)
                    .alignmentGuide(.horizontalCenterAlignment) { dimensions in
                        dimensions[HorizontalAlignment.center]
                    }
            }
            HStack(spacing: 0) {
                ForEach(elements.indices, id: \.self) { index in
                    Button(
                        action: {
                            selectedIndex = index
                            withAnimation {
                                scrollViewProxy?.scrollTo(index)
                            }
                        },
                        label: {
                            content(elements[index], selectedIndex == index)
                        }
                    )
                    .id(index)
                    .buttonStyle(PlainButtonStyle())
                    .background(
                        GeometryReader { proxy in
                            Color.clear.onAppear {
                                frames[index] = proxy.frame(in: .global)
                                validateScrollableState()
                            }
                        }
                    )
                    .alignmentGuide(
                        .horizontalCenterAlignment,
                        isActive: selectedIndex == index
                    ) { dimensions in
                        dimensions[HorizontalAlignment.center]
                    }
                }
            }
            .padding(.horizontal, 16.0)
        }
    }
    
    private func validateScrollableState() {
        guard let lastFrame = frames.last else { return }
        
        if lastFrame.width > .zero {
            let width = frames.reduce(0) { $0 + $1.width }
            
            if isScrollable && width <= backgroundFrame.width {
                isScrollable = false
            } else if !isScrollable && width > backgroundFrame.width {
                isScrollable = true
            }
        }
    }
}
