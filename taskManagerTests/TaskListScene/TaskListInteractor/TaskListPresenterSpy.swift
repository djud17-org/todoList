//
//  TaskListPresenterSpy.swift
//  taskManagerTests
//
//  Created by Давид Тоноян  on 30.03.2023.
//

@testable import taskManager

final class TaskPresenterSpy: ITaskPresenter {
	var viewController: ITaskListDisplayLogic?
	private(set) var isPresenterCalled = false

	func displayData(data: TaskListModel.ResponseDataModel) {
		isPresenterCalled = true
	}
}
