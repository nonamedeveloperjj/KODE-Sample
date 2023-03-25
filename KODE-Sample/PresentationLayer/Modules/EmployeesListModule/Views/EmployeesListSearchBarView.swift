//
//  EmployeesListSearchBarView.swift
//  KODE-Sample
//
//  Created by John Snow on 04/10/2022.
//

import SwiftUI

struct EmployeesListSearchBarView: View {
    @Binding private var enteredText: String
    @Binding private var isBottomSheetOpen: Bool
    @Binding private var sortState: EmployeesSortOrder
    private var isFocused: FocusState<Bool>.Binding
    
    private let appearance: Appearance
    
    private var clearButton: some View {
        Button {
            enteredText = ""
        } label: {
            Image(appearance.clearImageName)
                .foregroundColor(.gray)
                .padding(.trailing, 13)
        }
    }
    
    private var sortButton: some View {
        Button {
            isBottomSheetOpen = true
        } label: {
            let sortImageColor = sortState == .alphabet ? Color(hex: "#C3C3C6") : Color(hex: "#6534FF")
            Image(appearance.sortImageName)
                .foregroundColor(sortImageColor)
                .padding(.trailing, 13.5)
        }
    }
    
    private var cancelButton: some View {
        Button(appearance.cancelButtonText) {
            isFocused.wrappedValue = false
            enteredText = ""
        }
        .padding(.trailing, 28)
        .font(.system(size: 14.0, weight: .semibold))
        .foregroundColor(appearance.cancelButtonColor)
    }
    
    var body: some View {
        HStack(spacing: 0.0) {
            TextField(appearance.placeholderText, text: $enteredText)
                .focused(isFocused)
                .padding(9)
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
                            clearButton
                        }
                        
                        if !isFocused.wrappedValue && enteredText.isEmpty {
                            sortButton
                        }
                    }
                )
                .padding(.leading, 16)
                .padding(.trailing, isFocused.wrappedValue ? 12.0 : 16.0)
            
            if isFocused.wrappedValue {
                cancelButton
            }
        }
    }
    
    init(
        enteredText: Binding<String>,
        isFocused: FocusState<Bool>.Binding,
        isBottomSheetOpen: Binding<Bool>,
        sortState: Binding<EmployeesSortOrder>,
        appearance: Appearance = Appearance()
    ) {
        self._enteredText = enteredText
        self.isFocused = isFocused
        self._isBottomSheetOpen = isBottomSheetOpen
        self._sortState = sortState
        self.appearance = appearance
    }
}
            
extension EmployeesListSearchBarView {
    struct Appearance {
        let placeholderText: String = "EmployeesListModule.SearchBar.Placeholder".localized()
        let activeMagnifierImageName = "search_bar_magnifier"
        let clearImageName = "search_bar_clear"
        let sortImageName = "search_bar_sort"
        let backgroundColor: Color = Color(.systemGray6)
        let cancelButtonColor: Color = Color(hex: "#6534FF")
        let cancelButtonText = "EmployeesListModule.SearchBar.CancelTitle".localized()
    }
}

struct CommonSearchBar_Previews: PreviewProvider {
    static var previews: some View {
        EmployeesListSearchBarView(
            enteredText: .constant(""),
            isFocused: FocusState<Bool>().projectedValue,
            isBottomSheetOpen: .constant(false),
            sortState: .constant(.birtday)
        )
    }
}
