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
    
    var body: some View {
        VStack(spacing: 0.0) {
            Text("Сортировка")
                .font(.system(size: 20.0, weight: .semibold))
                .padding(EdgeInsets(top: 12.0, leading: 0.0, bottom: 38.0, trailing: 0.0))
            EmployeesListSortOptionView(
                isSelected: selectedOption == .alphabet,
                text: "По алфавиту",
                onSelect: {
                    selectedOption = .alphabet
                    isOpen.toggle()
                }
            )
            .padding(.bottom, 42.0)
            EmployeesListSortOptionView(
                isSelected: selectedOption == .birtday,
                text: "По дню рождения",
                onSelect: {
                    selectedOption = .birtday
                    isOpen.toggle()
                }
            )
        }
    }
    
    init(selectedOption: Binding<EmployeesSortOrder>, isOpen: Binding<Bool>) {
        self._selectedOption = selectedOption
        self._isOpen = isOpen
    }
}

struct EmployeesListSortView_Previews: PreviewProvider {
    static var previews: some View {
        EmployeesListSortView(
            selectedOption: .constant(.birtday), isOpen: .constant(true)
        )
    }
}
