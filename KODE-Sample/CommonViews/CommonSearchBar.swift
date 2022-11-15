//
//  CommonSearchBar.swift
//  KODE-Sample
//
//  Created by John Snow on 04/10/2022.
//

import SwiftUI

struct CommonSearchBar: View {
    @Binding var enteredText: String
    private var isFocused: FocusState<Bool>.Binding
    
    private let appearance: Appearance
    
    var body: some View {
        HStack {
            TextField(appearance.placeholderText, text: $enteredText)
                .focused(isFocused)
                .padding(10)
                .padding(.horizontal, 34)
                .background(Color(.systemGray6))
                .cornerRadius(16)
                .autocorrectionDisabled()
                .overlay(
                    HStack {
                        let magnifierImageColor = isFocused.wrappedValue ? Color(hex: "#050510") : Color(hex: "#C3C3C6")
                        Image(appearance.activeMagnifierImageName)
                            .foregroundColor(magnifierImageColor)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 14)
                        
                        if isFocused.wrappedValue && !enteredText.isEmpty {
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
            
            if isFocused.wrappedValue {
                Button("Отмена") {
                    isFocused.wrappedValue = false
                    enteredText = ""
                }
                .frame(height: 18.0)
                .padding(.trailing, 10)
                .foregroundColor(appearance.cancelButtonColor)
            }
        }
    }
    
    init(enteredText: Binding<String>, isFocused: FocusState<Bool>.Binding, appearance: Appearance = Appearance()) {
        _enteredText = enteredText
        self.isFocused = isFocused
        self.appearance = appearance
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
}

struct CommonSearchBar_Previews: PreviewProvider {
    static var previews: some View {
        CommonSearchBar(enteredText: .constant(""), isFocused: FocusState<Bool>().projectedValue)
    }
}
