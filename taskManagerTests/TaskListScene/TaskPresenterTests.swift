//
//  TasPresenterTests.swift
//  taskManagerTests
//
//  Created by CHURILOV DMITRIY on 28.03.2023.
//

import XCTest
@testable import taskManager
@testable import TaskManagerPackage

final class TaskPresenterTests: XCTestCase {
	private let taskListViewController = TaskListViewControllerSpy()
	
	func test_displayData_shouldSucceed() {
		
		// Arrange
		let sut = makeSut()
		let tasks = [
			RegularTask(title: "Починить машину"),
			ImportantTask(title: "Купить подарки", taskPriority: .high)
		]
		let section = [TaskListModel.ResponseDataModel.SectionWithTask(section: .completed, tasks: tasks)]
		let dataModel = TaskListModel.ResponseDataModel(sections: section)
		
		// Act
		sut.displayData(data: dataModel)
		
		// Assert
		XCTAssertTrue(taskListViewController.isRenderInvoked, "Метод TaskListViewController.render(:) не может быть вызван!")
	}
}

// MARK: - Private Extension
private extension TaskPresenterTests {
	
	func makeSut() -> TaskPresenter {
		let taskPresenter = TaskPresenter()
		taskPresenter.viewController = taskListViewController
		
		return taskPresenter
	}
}
