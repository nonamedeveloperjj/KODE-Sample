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
        Text("Hello, world!")
            .padding()
        Button("Search Employees") {
            
        }.onAppear {
            viewModel.fetchEmployees()
        }
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
