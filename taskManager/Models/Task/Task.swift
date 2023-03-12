//
//  TaskManager.swift
//  taskManager
//
//  Created by Давид Тоноян  on 12.02.2023.
//

import Foundation

/// Статус задачи.
enum TaskStatus: String {
	/// Запланирована.
	case planned

	/// Завершена.
	case completed
}

/// Модель задачи.
class Task {
	var title: String
	var taskStatus: TaskStatus = .planned

	init(title: String) {
		self.title = title
	}
}
