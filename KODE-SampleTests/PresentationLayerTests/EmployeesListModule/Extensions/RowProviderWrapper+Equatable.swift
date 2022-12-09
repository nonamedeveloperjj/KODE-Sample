//
//  RowProviderWrapper+Equatable.swift
//  KODE-SampleTests
//
//  Created by John Snow on 07/12/2022.
//

@testable import KODE_Sample

extension RowProviderWrapper: Equatable {
    public static func == (lhs: KODE_Sample.RowProviderWrapper, rhs: KODE_Sample.RowProviderWrapper) -> Bool {
        lhs.id == rhs.id
    }
}
