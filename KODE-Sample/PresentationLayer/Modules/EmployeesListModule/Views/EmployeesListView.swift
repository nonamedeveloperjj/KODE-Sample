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
    @State private var selectedPickerIndex: Int = 0
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
        EmployeesListSearchBarView(
            enteredText: $enteredText,
            isFocused: $isSearchBarFocused,
            isBottomSheetOpen: $isSortViewOpen,
            sortState: $viewModel.employeesSortState
        )
        .padding(.top, 18.0)
    }
    
    private var contentView: some View {
        NavigationView {
            ZStack {
                VStack(spacing: 0.0) {
                    searchBar
                    
                    SegmentedPicker(
                        EmployeeDepartmentFilter.allCases,
                        selectedIndex: $selectedPickerIndex,
                        selectionAlignment: .bottom,
                        content: { item, isSelected in
                            Text(item.title)
                                .font(
                                    .system(size: 15, weight: isSelected ? .semibold : .medium)
                                )
                                .foregroundColor(
                                    isSelected ? Color(hex: "#050510") : Color(hex: "#97979B")
                                )
                                .frame(height: 36.0)
                                .padding(.horizontal, 12.0)
                        },
                        selection: {
                            VStack(spacing: 0) {
                                Spacer()
                                Color(hex: "#6534FF").frame(height: 2)
                            }
                        }
                    )
                    .animation(.easeIn(duration: 0.3), value: selectedPickerIndex)
                    .padding(.top, 16.0)
                    
                    Divider()
                        .frame(height: 0.33)
                    
                    let rowProviderWrappers = viewModel.rowProviders(
                        with: enteredText,
                        departmentFilter: EmployeeDepartmentFilter(rawValue: selectedPickerIndex)
                    )
                    let shouldShowEmptyState = rowProviderWrappers.isEmpty
                    
                    List(rowProviderWrappers) { rowProviderWrapper in
                        rowProviderWrapper.rowProvider.provideRow()
                            .redacted(reason: viewModel.isLoadingEmployees ? .placeholder : [])
                            .listRowSeparator(.hidden)
                            .listRowInsets(EdgeInsets())
                            .overlay {
                                NavigationLink {
                                    if let employee = viewModel.rowModel(with: rowProviderWrapper.id) {
                                        LazyView(EmployeeProfileAssembly().createModule(with: employee))
                                    }
                                } label: {
                                    EmptyView()
                                }
                                .navigationTitle("")
                                .opacity(0.0)
                                .disabled(viewModel.isLoadingEmployees)
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
                    .transaction { transaction in
                        /// Workaround due to animations bug inside NavigationView
                        /// https://developer.apple.com/forums/thread/682779
                        transaction.animation = nil
                    }
                    .safeAreaInset(edge: .top) {
                        Spacer()
                            .frame(height: 16.0)
                    }
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
            ),
            employeesFilterValidator: EmployeesFilterValidator()
        )
        EmployeesListView(viewModel: viewModel)
    }
}
