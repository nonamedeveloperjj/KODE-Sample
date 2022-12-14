//
//  LazyView.swift
//  KODE-Sample
//
//  Created by John Snow on 09/12/2022.
//

import SwiftUI

/// Struct is used to lazy load views inside NavigationLink
/// https://developer.apple.com/forums/thread/650835
struct LazyView<Content: View>: View {
    private let build: () -> Content
    
    var body: Content {
        build()
    }
    
    init(_ build: @autoclosure @escaping () -> Content) {
        self.build = build
    }
}
