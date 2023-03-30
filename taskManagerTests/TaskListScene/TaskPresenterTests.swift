//
//  TasPresenterTests.swift
//  taskManagerTests
//
//  Created by CHURILOV DMITRIY on 28.03.2023.
//

import XCTest
@testable import taskManager

final class TaskPresenterTests: XCTestCase {
	private var taskListViewController: TaskListViewControllerSpy!
	
	func test_displayData_shouldSucceed() {
		
		// Arrange
		let sut = makeSut()
		let dataModel = TaskListModel.ResponseDataModel(sections: [])
		
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
		taskListViewController = TaskListViewControllerSpy()
		taskPresenter.viewController = taskListViewController
		
		return taskPresenter
	}
}
