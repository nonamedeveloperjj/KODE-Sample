//
//  EmployeesListRowModel+Equatable.swift
//  KODE-SampleTests
//
//  Created by John Snow on 29/11/2022.
//

@testable import KODE_Sample

extension EmployeesListRowModel: Equatable {
    public static func == (lhs: EmployeesListRowModel, rhs: EmployeesListRowModel) -> Bool {
        return lhs.id == rhs.id
    }
}
