//
//  TaskManager.swift
//  taskManager
//
//  Created by Давид Тоноян  on 12.02.2023.
//

import Foundation

/// Базовый класс Задача
class Task {
	var title: String
	var taskStatus: TaskStatus = .planned

	init(title: String) {
		self.title = title
	}

	enum TaskStatus: String {
		case planned
		case completed
	}
}

/// Обычные задачи
final class RegularTask: Task {}

/// Важные задачи с дедлайном и приоритетом
final class ImportantTask: Task {
	var deadLine: Date? {
		let value = taskPriority.rawValue

		return Calendar.current.date(
			byAdding: .day,
			value: value,
			to: Date()
		)
	}

	var taskPriority: TaskPriority

	init(title: String, taskPriority: TaskPriority) {
		self.taskPriority = taskPriority
		super.init(title: title)
	}

	enum TaskPriority: Int {
		case high = 1
		case medium = 2
		case low = 3
	}
}
