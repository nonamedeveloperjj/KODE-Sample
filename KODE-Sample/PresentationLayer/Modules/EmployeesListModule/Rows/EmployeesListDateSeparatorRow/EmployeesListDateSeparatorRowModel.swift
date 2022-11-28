//
//  EmployeesListDateSeparatorRowModel.swift
//  KODE-Sample
//
//  Created by John Snow on 24/11/2022.
//

import SwiftUI

struct EmployeesListDateSeparatorRowModel {
    let date: String
}

extension EmployeesListDateSeparatorRowModel: RowProvider {
    var id: String {
        date
    }
    
    func provideRow() -> AnyView {
        AnyView(EmployeesListDateSeparatorRowView(rowModel: self))
    }
}
