//
//  EmployeeProfileAssembly.swift
//  KODE-Sample
//
//  Created by John Snow on 29/11/2022.
//

import Foundation

final class EmployeeProfileAssembly {
    func createModule(with employee: Employee) -> EmployeeProfileView {
        let viewModel = EmployeeProfileViewModel(employee: employee)
        let view = EmployeeProfileView(viewModel: viewModel)
        return view
    }
}
