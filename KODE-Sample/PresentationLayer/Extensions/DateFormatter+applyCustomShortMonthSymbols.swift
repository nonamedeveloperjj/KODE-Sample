//
//  DateFormatter+applyCustomShortMonthSymbols.swift
//  KODE-Sample
//
//  Created by John Snow on 28/11/2022.
//

import Foundation

extension DateFormatter {
    func applyCustomShortMonthSymbols() {
        if locale.languageCode == "ru" {
            shortMonthSymbols = [
                "янв",
                "фев",
                "мар",
                "апр",
                "май",
                "июн",
                "июл",
                "авг",
                "сен",
                "окт",
                "ноя",
                "дек"
            ]
        }
    }
}
