//
//  EmployeesListView.swift
//  KODE-Sample
//
//  Created by John Snow on 03/10/2022.
//

import SwiftUI

struct EmployeesListView: View {
    @ObservedObject private var viewModel: EmployeesListViewModel
    
    var body: some View {
        List(viewModel.employees) { employee in
            EmployeesListRowView(employee: employee)
                .listRowSeparator(.hidden)
                .listRowInsets(EdgeInsets())
                .redacted(reason: viewModel.isLoadingEmployees ? .placeholder : [])
        }.refreshable {
            viewModel.fetchEmployees()
        }.onAppear {
            viewModel.fetchEmployees()
        }
        .listStyle(.plain)
    }
    
    init(viewModel: EmployeesListViewModel) {
        self.viewModel = viewModel
    }
}

struct EmployeesListView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = EmployeesListViewModel(employeesService: EmployeesService(httpClient: HTTPClientAssembly().create()))
        EmployeesListView(viewModel: viewModel)
    }
}
