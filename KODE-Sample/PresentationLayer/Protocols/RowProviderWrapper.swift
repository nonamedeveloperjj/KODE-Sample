//
//  RowProviderWrapper.swift
//  KODE-Sample
//
//  Created by John Snow on 25/11/2022.
//

import Foundation

struct RowProviderWrapper: Identifiable {
    var id: Int {
        rowProvider.id.hashValue
    }
    
    let rowProvider: any RowProvider
    
    init<T: RowProvider>(rowProvider: T) {
        self.rowProvider = rowProvider
    }
}
