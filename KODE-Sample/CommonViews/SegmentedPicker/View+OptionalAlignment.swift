//
//  View+OptionalAlignment.swift
//  KODE-Sample
//
//  Created by John Snow on 05/12/2022.
//

import SwiftUI

extension View {
    @ViewBuilder
    @inlinable func alignmentGuide(
        _ alignment: HorizontalAlignment,
        isActive: Bool,
        computeValue: @escaping (ViewDimensions) -> CGFloat
    ) -> some View {
        if isActive {
            alignmentGuide(alignment, computeValue: computeValue)
        } else {
            self
        }
    }

    @ViewBuilder
    @inlinable func alignmentGuide(
        _ alignment: VerticalAlignment,
        isActive: Bool,
        computeValue: @escaping (ViewDimensions) -> CGFloat
    ) -> some View {
        if isActive {
            alignmentGuide(alignment, computeValue: computeValue)
        } else {
            self
        }
    }
}
