//
//  OrderedTaskManager.swift
//  taskManager
//
//  Created by Давид Тоноян  on 18.02.2023.
//

import Foundation

/// Предоставляет список задач, отсортированные по статусу.
public final class OrderedTaskManager: ITaskManager {
	private let taskManager: ITaskManager

	public init(taskManager: ITaskManager) {
		self.taskManager = taskManager
	}

	public func addTask(task: Task) {
		taskManager.addTask(task: task)
	}

	public func removeTask(task: Task) {
		taskManager.removeTask(task: task)
	}

	public func allTasks() -> [Task] {
		sortedTask(arrayToSort: taskManager.allTasks())
	}

	public func completedTasks() -> [Task] {
		sortedTask(arrayToSort: taskManager.completedTasks())
	}

	public func uncompletedTasks() -> [Task] {
		sortedTask(arrayToSort: taskManager.uncompletedTasks())
	}

	private func sortedTask(arrayToSort: [Task]) -> [Task] {
		var sortedArray = arrayToSort.sorted { $0.title < $1.title }
		sortedArray = sortedArray.sorted {
			if let task1 = $0 as? ImportantTask, let task2 = $1 as? ImportantTask {
				return task1.taskPriority.rawValue < task2.taskPriority.rawValue
			}

			if $0 is ImportantTask, $1 is RegularTask {
				return true
			}

			if $0 is RegularTask, $1 is ImportantTask {
				return false
			}

			return true
		}

		return sortedArray
	}
}
