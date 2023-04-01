//
//  TaskLisInteractor.swift
//  taskManager
//
//  Created by Давид Тоноян  on 22.02.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol ITaskListBusinessLogic {

	/// Функция сообщает о готовности представления к отображению данных.
	func viewIsReady()

	/// Функция сообщает о выборе задачи.
	/// - Parameter indexPath: Индекс задачи.
	func didTaskSelected(at indexPath: IndexPath)
}

final class TaskListInteractor: ITaskListBusinessLogic {
	private let sectionManager: ISectionForTaskManagerAdapter
	private let presenter: ITaskPresenter

	init(sectionManager: ISectionForTaskManagerAdapter, presenter: ITaskPresenter) {
		self.sectionManager = sectionManager
		self.presenter = presenter
	}

	// MARK: Funcs

	func viewIsReady() {
		let datamodel = createDataModel()
		presenter.displayData(data: datamodel)
	}

	func didTaskSelected(at indexPath: IndexPath) {
		let sections = sectionManager.getSections()
		let sectionTasks = sectionManager.getTasksForSection(section: sections[indexPath.section])
		let task = sectionTasks[indexPath.row]

		task.taskStatus = task.taskStatus == .completed ? .planned : .completed

		let datamodel = createDataModel()
		presenter.displayData(data: datamodel)
	}

	private func createDataModel() -> TaskListModel.ResponseDataModel {
		let sections = sectionManager.getSections()
		var result: [TaskListModel.ResponseDataModel.SectionWithTask] = []

		for section in sections {
			let tasks = sectionManager.getTasksForSection(section: section)
			let sectionWithTasks = TaskListModel.ResponseDataModel.SectionWithTask(
				section: section,
				tasks: tasks
			)
			result.append(sectionWithTasks)
		}
		let response: TaskListModel.ResponseDataModel = .init(sections: result)

		return response
	}
}
