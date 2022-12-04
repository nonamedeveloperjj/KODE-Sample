//
//  EmployeesResponse.swift
//  KODE-Sample
//
//  Created by John Snow on 02/11/2022.
//

import Foundation

struct EmployeesResponse: Decodable {
    let items: [Employee]
}
