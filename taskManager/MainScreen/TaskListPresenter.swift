//
//  TaskListPresenter.swift
//  taskManager
//
//  Created by Давид Тоноян  on 19.02.2023.
//

import Foundation

protocol ITaskPresenter: AnyObject {
	var delegate: IViewDelegate? { get set }

	/// Функция сообщает о готовности представления к отображению данных
	func viewIsReady()
	
	/// Функция сообщает о выборе задачи по индексу
	/// - Parameter indexPath: Индекс задачи
	func didTaskSelected(at indexPath: IndexPath)
}

final class TaskPresenter: ITaskPresenter {
	// MARK: - Parameters

	weak var delegate: IViewDelegate?
	private let sectionManager: ISectionForTaskManagerAdapter

	// MARK: - Inits

	init(sectionManager: ISectionForTaskManagerAdapter) {
		self.sectionManager = sectionManager
	}

	// MARK: - Funcs

	func viewIsReady() {
		delegate?.render(viewData: mapViewData())
	}

	func didTaskSelected(at indexPath: IndexPath) {
		let sections = sectionManager.getSections()
		let sectionTasks = sectionManager.getTasksForSection(section: sections[indexPath.section])
		let task = sectionTasks[indexPath.row]

		task.taskStatus = task.taskStatus == .completed ? .planned : .completed

		delegate?.render(viewData: mapViewData())
	}

	private func mapViewData() -> MainModel.ViewData {
		var sections = [MainModel.ViewData.Section]()
		for section in sectionManager.getSections() {
			let sectionData = MainModel.ViewData.Section(
				title: section.title,
				tasks: mapTasksData(tasks: sectionManager.getTasksForSection(section: section))
			)

			sections.append(sectionData)
		}

		return MainModel.ViewData(tasksBySections: sections)
	}

	private func mapTasksData(tasks: [Task]) -> [MainModel.ViewData.Task] {
		tasks.map { mapTaskData(task: $0) }
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
