//
//  EmployeesListRowModel.swift
//  KODE-Sample
//
//  Created by John Snow on 24/11/2022.
//

import SwiftUI

struct EmployeesListRowModel {
    let id: String
    let avatarUrl: String
    let firstName: String
    let lastName: String
    let userTag: String
    let position: String
    let birthday: String
    let shouldShowBirtday: Bool
}

extension EmployeesListRowModel: RowProvider {
    func provideRow() -> AnyView {
        AnyView(EmployeesListRowView(rowModel: self))
    }
}
