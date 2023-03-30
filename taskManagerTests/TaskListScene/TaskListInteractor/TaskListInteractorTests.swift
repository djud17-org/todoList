//
//  TaskListInteractorTests.swift
//  taskManagerTests
//
//  Created by Давид Тоноян  on 30.03.2023.
//

@testable import taskManager
import XCTest

final class TaskListInteractorTests: XCTestCase {
	private var sectionManager: SectionForTaskManagerAdapterSpy!
	private var presenter: TaskPresenterSpy!

	func test_viewIsReady_presenterShouldBeCalled() {
		let sut = makeSut()

		sut.viewIsReady()

		XCTAssertTrue(presenter.isPresenterCalled, "Presenter не был вызван")
	}

	func test_didTaskSelected_sectionManagerShouldBeCalled() {
		let sut = makeSut()

		let indexPath = IndexPath(row: 0, section: 0)
		sut.didTaskSelected(at: indexPath)

		XCTAssertTrue(sectionManager.isGetSectionsCalled, "У SectionManager не был вызван метод getSections")
		XCTAssertTrue(sectionManager.isGetTasksForSection, "SectionManager не был вызван метод getTasksForSection")
	}

	func test_didTaskSelected_presenterShouldBeCalled() {
		let sut = makeSut()

		let indexPath = IndexPath(row: 0, section: 0)
		sut.didTaskSelected(at: indexPath)

		XCTAssertTrue(presenter.isPresenterCalled, "Presenter не был вызван")
	}

	func test_didTaskSelected_taskStatusShouldBeChanged() {
		let sut = makeSut()

		let indexPath = IndexPath(row: 0, section: 0)
		let previousTaskStatus = sectionManager.taskStatus

		sut.didTaskSelected(at: indexPath)
		let newTaskStatus = sectionManager.taskStatus

		XCTAssertEqual(previousTaskStatus, .planned, "Первоначальный статус задачи запланировано не установлен")
		XCTAssertEqual(newTaskStatus, .completed, "Статус задачи не был изменен на выполнено")
	}
}

private extension TaskListInteractorTests {
	func makeSut() -> ITaskListBusinessLogic {
		sectionManager = SectionForTaskManagerAdapterSpy()
		presenter = TaskPresenterSpy()
		let interactor = TaskListInteractor(sectionManager: sectionManager, presenter: presenter)

		return interactor
	}
}
