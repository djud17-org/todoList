//
//  TaskListPresenter.swift
//  taskManager
//
//  Created by Давид Тоноян  on 19.02.2023.
//

import Foundation

protocol ITaskPresenter: AnyObject {
	var viewController: ITaskListDisplayLogic? { get set }

	/// Функция для отображения данных на экране
	/// - Parameter data: Данные для отображения
	func displayData(data: MainModel.ResponseDataModel)
}

final class TaskPresenter: ITaskPresenter {
	// MARK: - Parameters

	weak var viewController: ITaskListDisplayLogic?

	// MARK: - Funcs

	func displayData(data: MainModel.ResponseDataModel) {
		let viewData = mapViewData(data: data)

		viewController?.render(viewData: viewData)
	}

	private func mapViewData(data: MainModel.ResponseDataModel) -> MainModel.ViewModel {
		var result = [MainModel.ViewModel.Section]()
		
		for element in data.sections {
			let sectionData = MainModel.ViewModel.Section(
				title: element.section.title,
				tasks: mapTasksData(tasks: element.tasks)
			)
			
			result.append(sectionData)
		}

		return MainModel.ViewModel(tasksBySections: result)
	}

	private func mapTasksData(tasks: [Task]) -> [MainModel.ViewModel.Task] {
		tasks.map { mapTaskData(task: $0) }
	}

	private func mapTaskData(task: Task) -> MainModel.ViewModel.Task {
		if let task = task as? ImportantTask {
			let result = MainModel.ViewModel.ImportantTask(
				title: task.title,
				taskStatus: task.taskStatus,
				isOverdue: task.deadLine < Date(),
				deadLine: task.deadLine.description,
				priority: task.taskPriority
			)

			return .importantTask(result)
		} else {
			let result = MainModel.ViewModel.RegularTask(
				title: task.title,
				taskStatus: task.taskStatus
			)

			return .regularTask(result)
		}
	}
}
