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
        dateFormatter.string(from: employee.birthday)
    }
    
    var employeeAge: String {
        let dateComponents = Calendar.current.dateComponents([.year], from: employee.birthday, to: Date())
        return String(dateComponents.year ?? 0) + " лет"
    }
    
    private var dateFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMMM yyyy"
        return dateFormatter
    }
    
    init(employee: Employee) {
        self.employee = employee
    }
}
