//
//  TaskListViewControllerTests.swift
//  taskManagerTests
//
//  Created by Alexey Radomskiy on 29.03.2023.
//

import XCTest
@testable import taskManager

final class TaskListViewControllerTests: XCTestCase {
	private var sut: TaskListViewController!
	private var interactorSpy: TaskListInteractorSpy!

	override func setUp() {
		super.setUp()

		sut = TaskListViewController()
		interactorSpy = TaskListInteractorSpy()

		sut.interactor = interactorSpy
	}

	override func tearDown() {
		sut = nil
		interactorSpy = nil

		super.tearDown()
	}

	func test_viewDidLoad_callsInteractor_viewIsReady() {
		sut.viewDidLoad()

		XCTAssertTrue(interactorSpy.viewIsReadyCalled, "Метод отработал некорректно")
	}

	func test_didSelectRowAt_callsInteractor_didTaskSelected() {
		let indexPath = IndexPath(row: 0, section: 0)

		sut.tableView(sut.tableView, didSelectRowAt: indexPath)

		XCTAssertTrue(interactorSpy.didTaskSelectedCalled, "Некорректный вызов метода")
		XCTAssertEqual(interactorSpy.selectedTaskIndexPath, indexPath, "Метод возвращет некорректный IndexPath")
	}
}

// MARK: - TaskListInteractorSpy

class TaskListInteractorSpy: ITaskListBusinessLogic {
	private(set) var viewIsReadyCalled = false
	private(set) var didTaskSelectedCalled = false
	private(set) var selectedTaskIndexPath: IndexPath?

	func viewIsReady() {
		viewIsReadyCalled = true
	}

	func didTaskSelected(at indexPath: IndexPath) {
		didTaskSelectedCalled = true
		selectedTaskIndexPath = indexPath
	}
}
