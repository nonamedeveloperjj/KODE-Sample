//
//  CommonSearchBar.swift
//  KODE-Sample
//
//  Created by John Snow on 04/10/2022.
//

import SwiftUI

struct CommonSearchBar: View {
    
    private let appearance: Appearance
    private var model: Model?
    
    @State private var isEditing = false
    @State private var enteredText: String = ""
    
    var body: some View {
        HStack {
            TextField(appearance.placeholderText, text: $enteredText)
                .padding(10)
                .padding(.horizontal, 34)
                .background(Color(.systemGray6))
                .cornerRadius(16)
                .overlay(
                    HStack {
                        let magnifierImageColor = isEditing ? Color(hex: "#050510") : Color(hex: "#C3C3C6")
                        Image(appearance.activeMagnifierImageName)
                            .foregroundColor(magnifierImageColor)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 14)
                        
                        if isEditing && !enteredText.isEmpty {
                            Button {
                                enteredText = ""
                            } label: {
                                Image(appearance.clearImageName)
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 13)
                            }
                        }
                    }
                )
                .padding(.horizontal, 16)
                .onTapGesture {
                    isEditing = true
                }
                .onChange(of: enteredText) { newValue in
                    model?.onTextEnter(newValue)
                }
            
            if isEditing {
                Button("Отмена") {
                    isEditing = false
                    enteredText = ""
                }
                .padding(.trailing, 10)
                .foregroundColor(appearance.cancelButtonColor)
            }
        }
    }
    
    init(appearance: Appearance = Appearance()) {
        self.appearance = appearance
    }
    
    mutating func update(with model: Model) {
        self.model = model
    }
}
            
extension CommonSearchBar {
    struct Appearance {
        let placeholderText: String = "Введи имя, тег, почту..."
        let activeMagnifierImageName = "search_bar_magnifier"
        let clearImageName = "search_bar_clear"
        let backgroundColor: Color = Color(.systemGray6)
        let cancelButtonColor: Color = Color(hex: "#6534FF")
    }
    
    struct Model {
        let onTextEnter: (String) -> Void
    }
}

struct CommonSearchBar_Previews: PreviewProvider {
    static var previews: some View {
        CommonSearchBar()
    }
}
