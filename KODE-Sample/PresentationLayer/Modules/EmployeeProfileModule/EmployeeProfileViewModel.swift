//
//  EmployeeProfileViewModel.swift
//  KODE-Sample
//
//  Created by John Snow on 29/11/2022.
//

import Foundation

final class EmployeeProfileViewModel: ObservableObject {
    let employee: Employee
    
    var formattedBirthday: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMMM yyyy"
        return dateFormatter.string(from: employee.birthday)
    }
    
    var employeeAge: String {
        let yearsOld = Calendar.current.dateComponents([.year], from: employee.birthday, to: Date()).year ?? 0
        let localizedFormat = NSLocalizedString("years_old", comment: "")
        return String(format: localizedFormat, yearsOld)
    }
    
    var phoneUrl: URL? {
        var urlComponents = URLComponents()
        urlComponents.scheme = "tel"
        urlComponents.path = employee.phone
        return urlComponents.url
    }
    
    init(employee: Employee) {
        self.employee = employee
    }
}
