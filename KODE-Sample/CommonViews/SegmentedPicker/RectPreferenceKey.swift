//
//  RectPreferenceKey.swift
//  KODE-Sample
//
//  Created by John Snow on 06/12/2022.
//

import SwiftUI

struct RectPreferenceKey: PreferenceKey {
    static var defaultValue = CGRect.zero

    static func reduce(value: inout CGRect, nextValue: () -> CGRect) {
        value = nextValue()
    }
}
