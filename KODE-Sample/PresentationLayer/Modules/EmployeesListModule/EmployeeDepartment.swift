//
//  EmployeeDepartment.swift
//  KODE-Sample
//
//  Created by John Snow on 06/12/2022.
//

import Foundation

enum EmployeeDepartment: Int, CaseIterable {
    case all
    case designers
    case analysts
    case managers
    case iOS
    case android
    case backend
    case support
    case QA
    case backOffice
    case frontend
    case PR
    case HR
    
    var title: String {
        switch self {
        case .all:
            return "EmployeesListModule.DepartmentFilter.All".localized()
        case .designers:
            return "EmployeesListModule.DepartmentFilter.Designers".localized()
        case .analysts:
            return "EmployeesListModule.DepartmentFilter.Analysts".localized()
        case .managers:
            return "EmployeesListModule.DepartmentFilter.Managers".localized()
        case .iOS:
            return "EmployeesListModule.DepartmentFilter.iOS".localized()
        case .android:
            return "EmployeesListModule.DepartmentFilter.Android".localized()
        case .backend:
            return "EmployeesListModule.DepartmentFilter.Backend".localized()
        case .support:
            return "EmployeesListModule.DepartmentFilter.Support".localized()
        case .QA:
            return "EmployeesListModule.DepartmentFilter.QA".localized()
       case .backOffice:
            return "EmployeesListModule.DepartmentFilter.BackOffice".localized()
        case .frontend:
            return "EmployeesListModule.DepartmentFilter.Frontend".localized()
        case .PR:
            return "EmployeesListModule.DepartmentFilter.PR".localized()
        case .HR:
            return "EmployeesListModule.DepartmentFilter.HR".localized()
        }
    }
    
    func department() -> Employee.Department? {
        switch self {
        case .all:
            return nil
        case .designers:
            return .design
        case .analysts:
            return .analytics
        case .managers:
            return .management
        case .iOS:
            return .iOS
        case .android:
            return .android
        case .backend:
            return .backend
        case .support:
            return .support
        case .QA:
            return .QA
       case .backOffice:
            return .backOffice
        case .frontend:
            return .frontend
        case .PR:
            return .PR
        case .HR:
            return .HR
        }
    }
}
