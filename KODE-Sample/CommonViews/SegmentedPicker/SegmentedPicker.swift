//
//  SegmentedPicker.swift
//  KODE-Sample
//
//  Created by John Snow on 05/12/2022.
//

import SwiftUI

struct SegmentedPicker<Element, Content, Selection>: View where Content: View, Selection: View {
    @State private var frames: [CGRect]
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
        self._frames = State(
            wrappedValue: Array(repeating: .zero, count: elements.count)
        )
        self.selectionAlignment = selectionAlignment
    }

    public var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
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
                            },
                            label: {
                                content(elements[index], selectedIndex == index)
                            }
                        )
                        .buttonStyle(PlainButtonStyle())
                        .background(GeometryReader { proxy in
                            Color.clear.onAppear { frames[index] = proxy.frame(in: .global) }
                        })
                        .alignmentGuide(
                            .horizontalCenterAlignment,
                            isActive: selectedIndex == index
                        ) { dimensions in
                            dimensions[HorizontalAlignment.center]
                        }
                    }
                }
            }
        }
    }
}
