//
//  Date.swift
//  taskManager
//
//  Created by Давид Тоноян  on 12.02.2023.
//

import Foundation

extension Date {
	private var dateFormatter: DateFormatter {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "dd.MM.yyyy"

		return dateFormatter
	}

	/// Строковое представление даты в формате "dd.MM.yyyy".
	var description: String {
		dateFormatter.string(from: self)
	}
}
