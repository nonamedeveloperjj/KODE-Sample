//
//  RowProvider.swift
//  KODE-Sample
//
//  Created by John Snow on 24/11/2022.
//

import SwiftUI

protocol RowProvider: Identifiable {
    func provideRow() -> AnyView
}
