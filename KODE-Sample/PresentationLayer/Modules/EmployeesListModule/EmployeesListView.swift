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
    @State private var isSortViewOpen = false
    @FocusState private var isSearchBarFocused: Bool
    
    private var errorView: some View {
        var errorView = EmployeesListErrorView()
        errorView.onRetry = {
            viewModel.fetchEmployees()
        }
        return errorView
    }
    
    private var dimmedView: some View {
        Color.black.opacity(0.16)
            .edgesIgnoringSafeArea(.all)
            .gesture(
                DragGesture().onChanged { _ in
                    isSortViewOpen = false
                }
            ).onTapGesture {
                isSortViewOpen = false
            }
    }
    
    private var bottomSheetView: some View {
        BottomSheetView(
            isOpen: $isSortViewOpen,
            maxHeight: 222.0
        ) {
            EmployeesListSortView(
                selectedOption: $viewModel.employeesSortState,
                isOpen: $isSortViewOpen
            )
        }
        .transition(
            .asymmetric(
                insertion: .move(edge: .bottom), removal: .move(edge: .bottom)
            )
        )
        .zIndex(1)
        .edgesIgnoringSafeArea(.all)
    }
    
    private var searchBar: some View {
        CommonSearchBar(
            enteredText: $enteredText,
            isFocused: $isSearchBarFocused,
            isBottomSheetOpen: $isSortViewOpen,
            sortState: $viewModel.employeesSortState
        )
    }
    
    private var contentView: some View {
        NavigationView {
            ZStack {
                VStack {
                    searchBar
                    
                    let rowProviderWrappers = viewModel.rowProviders(with: enteredText)
                    let shouldShowEmptyState = rowProviderWrappers.isEmpty
                    
                    List(rowProviderWrappers) { rowProviderWrapper in
                        let rowModel = viewModel.rowModel(with: rowProviderWrapper.id)
                        rowProviderWrapper.rowProvider.provideRow()
                            .redacted(reason: viewModel.isLoadingEmployees ? .placeholder : [])
                            .listRowSeparator(.hidden)
                            .listRowInsets(EdgeInsets())
                            .overlay {
                                NavigationLink {
                                    if let employee = rowModel {
                                        EmployeeProfileAssembly().createModule(with: employee)
                                    }
                                } label: {
                                    EmptyView()
                                }
                                .navigationTitle("")
                                .opacity(0.0)
                                .disabled(viewModel.isLoadingEmployees || rowModel == nil)
                            }
                    }.refreshable {
                        viewModel.fetchEmployees()
                    }.onFirstAppear {
                        viewModel.fetchEmployees()
                    }.gesture(DragGesture().onChanged({ _ in
                        isSearchBarFocused = false
                    }))
                    .overlay(alignment: .top) {
                        if shouldShowEmptyState {
                            EmployeesListEmptyView()
                        }
                    }
                    .disabled(shouldShowEmptyState)
                    .listStyle(.plain)
                    .ignoresSafeArea()
                    .animation(nil, value: UUID())
                }
                
                if isSortViewOpen {
                    dimmedView
                    bottomSheetView
                }
            }
        }
        .animation(.default, value: isSortViewOpen)
        .accentColor(Color(hex: "#050510"))
    }
    
    var body: some View {
        if viewModel.fetchEmployeesError == nil {
            contentView
        } else {
            errorView
        }
    }
    
    init(viewModel: EmployeesListViewModel) {
        self.viewModel = viewModel
    }
}

struct EmployeesListView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = EmployeesListViewModel(
            employeesService: EmployeesService(httpClient: HTTPClientAssembly().create()),
            rowsFactory: EmployeesListRowsFactory(
                strategyProvider: EmployeesListRowsFactoryStrategyProvider()
            )
        )
        EmployeesListView(viewModel: viewModel)
    }
}
