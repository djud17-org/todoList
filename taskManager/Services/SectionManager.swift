//
//  SectionManager.swift
//  taskManager
//
//  Created by Давид Тоноян  on 18.02.2023.
//

import Foundation
import TaskManagerPackage

/// Перечисление с доступными секциями.
enum Section {
	case completed
	case uncompleted

	var title: String {
		switch self {
		case .completed:
			return L10n.Section.CompletedTasks.title
		case .uncompleted:
			return L10n.Section.UncompletedTasks.title
		}
	}
}

protocol ISectionForTaskManagerAdapter {

	/// Функция позволяет получить доступные секции для таблицы.
	/// - Returns: массив секций.
	func getSections() -> [Section]

	/// Функция позволяет получить массив данных для конкретной секции.
	/// - Parameter section: индекс секции.
	/// - Returns: массив данных.
	func getTasksForSection(section: Section) -> [Task]
}

/// Менеджер секций для таблицы
final class SectionForTaskManagerAdapter: ISectionForTaskManagerAdapter {
	private let sections: [Section] = [.uncompleted, .completed]
	private let taskManager: ITaskManager

	init(taskManager: ITaskManager) {
		self.taskManager = taskManager
	}

	func getSections() -> [Section] {
		sections
	}

	func getTasksForSection(section: Section) -> [Task] {
		switch section {
		case .completed:
			return taskManager.completedTasks()
		case .uncompleted:
			return taskManager.uncompletedTasks()
		}
	}
}
