//
//  Employee+Equatable.swift
//  KODE-SampleTests
//
//  Created by John Snow on 03/04/2023.
//

import Foundation
@testable import KODE_Sample

extension Employee: Equatable {
    public static func == (lhs: Employee, rhs: Employee) -> Bool {
        lhs.id == rhs.id
    }
}
