//
//  TaskListViewControllerSpy.swift
//  taskManagerTests
//
//  Created by CHURILOV DMITRIY on 28.03.2023.
//

@testable import taskManager

/// Класс - шпион, способствующий проведению тестов корректной работы TaskListPresenter.
final class TaskListViewControllerSpy: ITaskListDisplayLogic {
	
	// MARK: - Internal Properties
	private(set) var isRenderInvoked = false
	private(set) var viewModel = TaskListModel.ViewModel(tasksBySections: [])
	
	// MARK: - Internal Methods
	func render(viewData: taskManager.TaskListModel.ViewModel) {
		isRenderInvoked = true
	}
}
