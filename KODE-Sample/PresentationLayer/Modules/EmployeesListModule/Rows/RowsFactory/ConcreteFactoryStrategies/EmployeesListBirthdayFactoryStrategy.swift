//
//  EmployeesListBirthdayFactoryStrategy.swift
//  KODE-Sample
//
//  Created by John Snow on 24/11/2022.
//

import Foundation

final class EmployeesListBirthdayFactoryStrategy: EmployeesListRowsFactoryStrategy {
    private var dateFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMM"
        dateFormatter.applyCustomShortMonthSymbols()
        return dateFormatter
    }
    
    private var calendar: Calendar {
        Calendar.current
    }
    
    func rowProviders(from employees: [Employee]) -> [any RowProvider] {
        var currentYearBirthdayEmployees: [Employee] = []
        var nextYearBirthdayEmployees: [Employee] = []
        
        employees.forEach { employee in
            let employeeBirthday = dateByDropping([.day, .month], from: employee.birthday)
            let currentDate = dateByDropping([.day, .month], from: Date())
            
            if employeeBirthday.compare(currentDate) == .orderedAscending {
                nextYearBirthdayEmployees.append(employee)
            } else {
                currentYearBirthdayEmployees.append(employee)
            }
        }
        
        currentYearBirthdayEmployees.sort(by: { isOrderAscending(firstDate: $0.birthday, secondDate: $1.birthday) })
        nextYearBirthdayEmployees.sort(by: { isOrderAscending(firstDate: $0.birthday, secondDate: $1.birthday) })
        
        var rowProviders: [any RowProvider] = []
        let currentYearBirthdayRowModels = currentYearBirthdayEmployees.map { rowModel(from: $0) }
        rowProviders.append(contentsOf: currentYearBirthdayRowModels)
        
        if !nextYearBirthdayEmployees.isEmpty, let yearComponent = calendar.dateComponents([.year], from: Date()).year {
            let nextYear = yearComponent + 1
            let separatorRowModel = EmployeesListDateSeparatorRowModel(date: String(nextYear))
            rowProviders.append(separatorRowModel)
        }
        
        let nextYearBirthdayRowModels = nextYearBirthdayEmployees.map { rowModel(from: $0) }
        rowProviders.append(contentsOf: nextYearBirthdayRowModels)
        
        return rowProviders
    }
    
    private func rowModel(from employee: Employee) -> EmployeesListRowModel {
        let rowModel = EmployeesListRowModel(
            id: employee.id,
            avatarUrl: employee.avatarUrl,
            firstName: employee.firstName,
            lastName: employee.lastName,
            userTag: employee.userTag,
            position: employee.position,
            birthday: dateFormatter.string(from: employee.birthday),
            shouldShowBirtday: true
        )
        return rowModel
    }
    
    private func isOrderAscending(firstDate: Date, secondDate: Date) -> Bool {
        let firstDateDroppingYear = dateByDropping([.day, .month], from: firstDate)
        let secondDateDroppingYear = dateByDropping([.day, .month], from: secondDate)
        return firstDateDroppingYear.compare(secondDateDroppingYear) == .orderedAscending
    }
    
    private func dateByDropping(_ components: Set<Calendar.Component>, from date: Date) -> Date {
        return calendar.date(from: calendar.dateComponents(components, from: date)) ?? Date()
    }
}
