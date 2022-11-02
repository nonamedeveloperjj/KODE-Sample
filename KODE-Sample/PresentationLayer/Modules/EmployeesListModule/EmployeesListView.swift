//
//  EmployeesListView.swift
//  KODE-Sample
//
//  Created by John Snow on 03/10/2022.
//

import SwiftUI

struct EmployeesListView: View {
    private let presenter: EmployeesListPresenterProtocol
    
    var body: some View {
        Text("Hello, world!")
            .padding()
        Button("Search Employees") {
            presenter.viewIsReady()
        }
    }
    
    init(presenter: EmployeesListPresenterProtocol) {
        self.presenter = presenter
    }
}

struct EmployeesListView_Previews: PreviewProvider {
    static var previews: some View {
        let presenter = EmployeesListPresenter(employeesService: EmployeesService(httpClient: HTTPClientAssembly().create()))
        EmployeesListView(presenter: presenter)
    }
}
