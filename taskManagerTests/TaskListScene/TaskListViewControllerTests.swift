//
//  TaskListViewControllerTests.swift
//  taskManagerTests
//
//  Created by Alexey Radomskiy on 29.03.2023.
//

import XCTest
@testable import taskManager

final class TaskListViewControllerTests: XCTestCase {

	func test_viewDidLoad_callsInteractorViewIsReady() {
		let interactorSpy = TaskListInteractorSpy()
		let sut = makeSut(interactorSpy: interactorSpy)

		sut.viewDidLoad()

		XCTAssertTrue(interactorSpy.viewIsReadyCalled, "Метод отработал некорректно")
	}

	func test_didSelectRowAt_callsInteractorDidTaskSelected() {
		let interactorSpy = TaskListInteractorSpy()
		let sut = makeSut(interactorSpy: interactorSpy)
		let indexPath = IndexPath(row: 0, section: 0)

		sut.tableView(sut.tableView, didSelectRowAt: indexPath)

		XCTAssertTrue(interactorSpy.didTaskSelectedCalled, "Некорректный вызов метода")
		XCTAssertEqual(interactorSpy.selectedTaskIndexPath, indexPath, "Метод возвращет некорректный IndexPath")
	}
}

// MARK: - TaskListViewControllerTests

private extension TaskListViewControllerTests {

	func makeSut(interactorSpy: ITaskListBusinessLogic) -> TaskListViewController {
		let sut = TaskListViewController()
		sut.interactor = interactorSpy

		return sut
	}
}
