//
//  EmployeesListDateSeparatorRowModel+Equatable.swift
//  KODE-SampleTests
//
//  Created by John Snow on 29/11/2022.
//

@testable import KODE_Sample

extension EmployeesListDateSeparatorRowModel: Equatable {
    public static func == (lhs: EmployeesListDateSeparatorRowModel, rhs: EmployeesListDateSeparatorRowModel) -> Bool {
        lhs.date == rhs.date
    }
}
