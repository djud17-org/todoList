//
//  TaskManager.swift
//  taskManager
//
//  Created by Давид Тоноян  on 12.02.2023.
//

import Foundation

protocol ITaskManager {
	/// Добавляет задачу в список задач менеджера.
	/// - Parameter task: задача, которую нужно добавить.
	func addTask(task: Task)

	/// Удаляет задачу
	/// - Parameter task: задача, которую нужно удалить.
	func removeTask(task: Task)

	/// Возвращает все хранящиеся задачи.
	/// - Returns: Массив задач.
	func allTasks() -> [Task]

	/// Возвращает все задачи со статусом выполнено.
	/// - Returns: Массив выполненных задач.
	func completedTasks() -> [Task]

	/// Возвращает все задачи со статусом не выполнено.
	/// - Returns: Массив невыполненных задач.
	func uncompletedTasks() -> [Task]
}

/// Предоставляет список задач, отсортированные по статусу.
final class TaskManager: ITaskManager {
	private var taskList = [Task]()

	func addTask(task: Task) {
		taskList.append(task)
	}

	func removeTask(task: Task) {
		taskList.removeAll(where: { $0 === task })
	}

	func allTasks() -> [Task] {
		taskList
	}

	func completedTasks() -> [Task] {
		taskList.filter { $0.taskStatus == .completed }
	}

	func uncompletedTasks() -> [Task] {
		taskList.filter { $0.taskStatus == .planned }
	}
}
