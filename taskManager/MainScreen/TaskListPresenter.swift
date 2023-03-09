//
//  TaskListPresenter.swift
//  taskManager
//
//  Created by Давид Тоноян  on 19.02.2023.
//

import Foundation

protocol ITaskPresenter: AnyObject {
	var viewController: TaskListDisplayLogic? { get set }

	/// Функция для отображения данных на экране
	/// - Parameter data: Данные для отображения
	func displayData(data: MainModel.DataModel)
}

final class TaskPresenter: ITaskPresenter {
	// MARK: - Parameters

	weak var viewController: TaskListDisplayLogic?

	// MARK: - Funcs

	func displayData(data: MainModel.DataModel) {
		let viewData = mapViewData(
			sections: data.sections,
			data: data.data
		)

		viewController?.render(viewData: viewData)
	}

	private func mapViewData(sections: [Section], data: [Section: [Task]]) -> MainModel.ViewData {
		var result = [MainModel.ViewData.Section]()
		for section in sections {
			let sectionData = MainModel.ViewData.Section(
				title: section.title,
				tasks: mapTasksData(tasks: data[section])
			)

			result.append(sectionData)
		}

		return MainModel.ViewData(tasksBySections: result)
	}

	private func mapTasksData(tasks: [Task]?) -> [MainModel.ViewData.Task] {
		guard let tasks = tasks else { return [] }

		return tasks.map { mapTaskData(task: $0) }
	}

	private func mapTaskData(task: Task) -> MainModel.ViewData.Task {
		if let task = task as? ImportantTask {
			let result = MainModel.ViewData.ImportantTask(
				title: task.title,
				taskStatus: task.taskStatus,
				isOverdue: task.deadLine < Date(),
				deadLine: task.deadLine.description,
				priority: task.taskPriority
			)

			return .importantTask(result)
		} else {
			let result = MainModel.ViewData.RegularTask(
				title: task.title,
				taskStatus: task.taskStatus
			)

			return .regularTask(result)
		}
	}
}
