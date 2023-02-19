//
//  TaskListPresenter.swift
//  taskManager
//
//  Created by Давид Тоноян  on 19.02.2023.
//

import Foundation

protocol IGetDataProtocol {
	var numberOfSections: Int { get }

	/// Функция позволяет получить количество ячеек для секции
	/// - Parameter section: индекс секции
	/// - Returns: число ячеек
	func getNumberOfRows(inSection section: Int) -> Int

	/// Функция позволяет получить нужную модель данных для ячейки
	/// - Parameter indexPath: индекс ячейки
	/// - Returns: модель данных
	func getDataModel(forRowAt indexPath: IndexPath) -> ICellViewAnyModel?

	/// Функция позволяет получить название для секции
	/// - Parameter section: индекс секции
	/// - Returns: название секции
	func getTitle(forHeaderInSection section: Int) -> String?
}

protocol IEventProtocol {
	/// Функция сообщает презентеру, что была нажата ячейка
	/// - Parameter indexPath: индекс нажатой ячейки
	func cellTapped(at indexPath: IndexPath)
}

protocol ITaskPresenter: AnyObject, IGetDataProtocol, IEventProtocol {
	var delegate: IViewDelegate? { get set }
}

final class TaskPresenter: ITaskPresenter {
	// MARK: - Parameters

	weak var delegate: IViewDelegate?
	private let sectionManager: ISectionForTaskManagerAdapter

	var numberOfSections: Int {
		sectionManager.getSections().count
	}

	// MARK: - Inits

	init(sectionManager: ISectionForTaskManagerAdapter) {
		self.sectionManager = sectionManager
	}

	// MARK: - Funcs

	func getNumberOfRows(inSection section: Int) -> Int {
		let sections = sectionManager.getSections()

		return sectionManager.getTasksForSection(section: sections[section]).count
	}

	func getDataModel(forRowAt indexPath: IndexPath) -> ICellViewAnyModel? {
		let sections = sectionManager.getSections()
		let tasks: [Task] = sectionManager.getTasksForSection(section: sections[indexPath.section])
		let task: Task = tasks[indexPath.row]

		var model: ICellViewAnyModel?
		if let importantTask = task as? ImportantTask {
			let deadLine = importantTask.deadLine?.description ?? ""

			model = ImportantTaskCellModel(
				taskStatus: importantTask.taskStatus,
				taskPriority: importantTask.taskPriority,
				taskName: importantTask.title,
				taskDeadline: deadLine
			)
		} else if let regularTask = task as? RegularTask {
			model = RegularTaskCellModel(
				taskStatus: regularTask.taskStatus,
				taskName: regularTask.title
			)
		}

		return model
	}

	func cellTapped(at indexPath: IndexPath) {
		let sections = sectionManager.getSections()
		let tasks: [Task] = sectionManager.getTasksForSection(section: sections[indexPath.section])
		let task: Task = tasks[indexPath.row]

		task.taskStatus = task.taskStatus == .completed ? .planned : .completed

		delegate?.renderData()
	}

	func getTitle(forHeaderInSection section: Int) -> String? {
		let sections = sectionManager.getSections()

		return sections[section].title
	}
}
