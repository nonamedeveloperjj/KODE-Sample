//
//  EmployeesListSortOptionView.swift
//  KODE-Sample
//
//  Created by John Snow on 21/11/2022.
//

import SwiftUI

struct EmployeesListSortOptionView: View {
    private let isSelected: Bool
    private let text: String
    
    private let onSelect: (() -> Void)
    
    var body: some View {
        HStack(spacing: 0.0) {
            Button {
                onSelect()
            } label: {
                let strokeWidth = isSelected ? 6.0 : 2.0
                Circle()
                    .strokeBorder(lineWidth: strokeWidth)
                    .foregroundColor(Color(hex: "#6534FF"))
            }
            .frame(width: 20.0, height: 20.0)
            .padding(
                EdgeInsets(top: 0.0, leading: 18.0, bottom: 0.0, trailing: 14.0)
            )
            
            Text(text)
                .font(.system(size: 16.0, weight: .medium))
            Spacer()
        }
    }
    
    init(
        isSelected: Bool,
        text: String,
        onSelect: @escaping (() -> Void)
    ) {
        self.isSelected = isSelected
        self.text = text
        self.onSelect = onSelect
    }
}

struct EmployeesListSortOptionView_Previews: PreviewProvider {
    static var previews: some View {
        EmployeesListSortOptionView(
            isSelected: true,
            text: "EmployeesListModule.EmployeesListSortView.AlphabetTitle".localized(),
            onSelect: {}
        )
    }
}
