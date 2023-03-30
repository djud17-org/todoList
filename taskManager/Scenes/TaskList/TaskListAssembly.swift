//
//  TaskListAssembly.swift
//  taskManager
//
//  Created by Давид Тоноян  on 09.03.2023.
//

import UIKit
import TaskManagerPackage

final class TaskListAssembly: IAssembly {
	func assembly() -> UIViewController {
		let viewController = TaskListViewController()
		let presenter = TaskPresenter()
		let interactor = TaskListInteractor(sectionManager: configureSectionManager(), presenter: presenter)
		viewController.interactor = interactor
		presenter.viewController = viewController

		return viewController
	}

	private func configureSectionManager() -> ISectionForTaskManagerAdapter {
		let taskRepository: ITaskRepository = TaskRepository()
		let taskManager: ITaskManager = TaskManager()
		let orderedTaskManager: ITaskManager = OrderedTaskManager(taskManager: taskManager)

		let tasks = taskRepository.loadTasks()
		tasks.forEach { orderedTaskManager.addTask(task: $0) }

		let sectionManager: ISectionForTaskManagerAdapter =
			SectionForTaskManagerAdapter(taskManager: orderedTaskManager)

		return sectionManager
	}
}
