//
//  String+localized.swift
//  KODE-Sample
//
//  Created by John Snow on 05/12/2022.
//

import Foundation

extension String {
    func localized(
        tableName: String? = nil,
        bundle: Bundle = Bundle.main,
        comment: String? = nil
    ) -> String {
        return NSLocalizedString(
            self,
            tableName: tableName,
            bundle: bundle,
            value: "",
            comment: comment ?? "\(self)_comment"
        )
  }
}
