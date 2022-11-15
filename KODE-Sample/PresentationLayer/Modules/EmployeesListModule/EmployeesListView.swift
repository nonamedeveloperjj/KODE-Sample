//
//  EmployeesListView.swift
//  KODE-Sample
//
//  Created by John Snow on 03/10/2022.
//

import SwiftUI

struct EmployeesListView: View {
    @ObservedObject private var viewModel: EmployeesListViewModel
    @State private var enteredText = ""
    @FocusState private var isSearchBarFocused: Bool
    
    var body: some View {
        CommonSearchBar(enteredText: $enteredText, isFocused: $isSearchBarFocused)
        List(viewModel.employees.filter({
            viewModel.isIncluded(employee: $0, enteredText: enteredText)
        })) { employee in
            EmployeesListRowView(employee: employee)
                .listRowSeparator(.hidden)
                .listRowInsets(EdgeInsets())
                .redacted(reason: viewModel.isLoadingEmployees ? .placeholder : [])
        }.refreshable {
            viewModel.fetchEmployees()
        }.onAppear {
            viewModel.fetchEmployees()
        }.gesture(DragGesture().onChanged({ _ in
            isSearchBarFocused = false
        }))
        .listStyle(.plain)
        .ignoresSafeArea()
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
