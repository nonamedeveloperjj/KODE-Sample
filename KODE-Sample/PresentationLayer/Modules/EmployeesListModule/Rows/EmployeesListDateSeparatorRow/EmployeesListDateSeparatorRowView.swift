//
//  EmployeesListDateSeparatorRowView.swift
//  KODE-Sample
//
//  Created by John Snow on 24/11/2022.
//

import SwiftUI

struct EmployeesListDateSeparatorRowView: View {
    private let appearance: Appearance
    private let rowModel: EmployeesListDateSeparatorRowModel
    
    private var roundedRectangle: some View {
        RoundedRectangle(cornerRadius: 4.0)
            .fill(appearance.primaryColor)
            .frame(width: 72.0, height: 1.0)
    }
    
    var body: some View {
        HStack(spacing: 0.0) {
            roundedRectangle
            Spacer()
            Text(rowModel.date)
                .font(.system(size: 15.0, weight: .medium))
                .foregroundColor(appearance.primaryColor)
            Spacer()
            roundedRectangle
                
        }
        .padding(.all, 24.0)
    }
    
    init(
        rowModel: EmployeesListDateSeparatorRowModel,
        appearance: Appearance = Appearance()
    ) {
        self.rowModel = rowModel
        self.appearance = appearance
    }
}

extension EmployeesListDateSeparatorRowView {
    struct Appearance {
        let primaryColor = Color(hex: "#C3C3C6")
    }
}

struct EmployeesListDateSeparatorRowView_Previews: PreviewProvider {
    static var previews: some View {
        EmployeesListDateSeparatorRowView(rowModel: .init(date: "2023"))
    }
}
