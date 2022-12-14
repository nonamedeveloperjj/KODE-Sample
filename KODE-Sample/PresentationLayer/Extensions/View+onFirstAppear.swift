//
//  View+onFirstAppear.swift
//  KODE-Sample
//
//  Created by John Snow on 23/11/2022.
//

import SwiftUI

public extension View {
    func onFirstAppear(_ action: @escaping () -> ()) -> some View {
        modifier(FirstAppear(action: action))
    }
}

private struct FirstAppear: ViewModifier {
    private let action: () -> ()
    
    @State private var hasAppeared = false
    
    internal init(action: @escaping () -> ()) {
        self.action = action
    }
    
    func body(content: Content) -> some View {
        content.onAppear {
            guard !hasAppeared else { return }
            hasAppeared = true
            action()
        }
    }
}
