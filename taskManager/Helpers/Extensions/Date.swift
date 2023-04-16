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
		dateFormatter.dateFormat = L10n.Main.dateFormat

		return dateFormatter
	}

	/// Строковое представление даты в локальном формате
	var description: String {
		dateFormatter.string(from: self)
	}
}
