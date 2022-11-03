//
//  EmployeesListAssembly.swift
//  KODE-Sample
//
//  Created by John Snow on 12/10/2022.
//

import SwiftUI

final class EmployeesListAssembly {
    func createModule() -> EmployeesListView {
        let employeesService = EmployeesService(httpClient: HTTPClientAssembly().create())
        let viewModel = EmployeesListViewModel(employeesService: employeesService)
        let view = EmployeesListView(viewModel: viewModel)
        return view
    }
}
