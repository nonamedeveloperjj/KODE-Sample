//
//  EmployeesListSortView.swift
//  KODE-Sample
//
//  Created by John Snow on 21/11/2022.
//

import SwiftUI

struct EmployeesListSortView: View {
    @Binding private var selectedOption: EmployeesSortOrder
    @Binding private var isOpen: Bool
    @State private var isAlphabetOptionSelected = false
    @State private var isBirthdayOptionSelected = false
    
    var body: some View {
        VStack(spacing: 0.0) {
            Text("Сортировка")
                .font(.system(size: 20.0, weight: .semibold))
                .padding(EdgeInsets(top: 12.0, leading: 0.0, bottom: 38.0, trailing: 0.0))
            EmployeesListSortOptionView(
                isSelected: $isAlphabetOptionSelected,
                text: "По алфавиту",
                onSelect: {
                    isOpen.toggle()
                    updateSelectedOption(newValue: .alphabet)
                }
            )
            .padding(.bottom, 42.0)
            EmployeesListSortOptionView(
                isSelected: $isBirthdayOptionSelected,
                text: "По дню рождения",
                onSelect: {
                    isOpen.toggle()
                    updateSelectedOption(newValue: .birtday)
                }
            )
        }.onAppear {
            updateSelectedOption(newValue: selectedOption)
        }
    }
    
    init(selectedOption: Binding<EmployeesSortOrder>, isOpen: Binding<Bool>) {
        self._selectedOption = selectedOption
        self._isOpen = isOpen
    }
    
    private func updateSelectedOption(newValue: EmployeesSortOrder) {
        selectedOption = newValue
        
        switch selectedOption {
        case .alphabet:
            isAlphabetOptionSelected = true
            isBirthdayOptionSelected = false
        case .birtday:
            isBirthdayOptionSelected = true
            isAlphabetOptionSelected = false
        }
    }
}

struct EmployeesListSortView_Previews: PreviewProvider {
    static var previews: some View {
        EmployeesListSortView(
            selectedOption: .constant(.birtday), isOpen: .constant(true)
        )
    }
}
