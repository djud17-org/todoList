//
//  SectionManagerTests.swift
//  taskManagerTests
//
//  Created by Давид Тоноян  on 15.03.2023.
//

@testable import taskManager
import XCTest

final class SectionManagerTests: XCTestCase {
	private var taskManager: TaskManagerMock!
	private var sectionManager: SectionForTaskManagerAdapter!

	override func setUp() {
		taskManager = TaskManagerMock()
		sectionManager = SectionForTaskManagerAdapter(
			taskManager: taskManager
		)
	}

	override func tearDown() {
		taskManager = nil
		sectionManager = nil
	}

	func test_getSections() {
		let sections = sectionManager.getSections()

		XCTAssertFalse(
			sections.isEmpty,
			"Список секций пуст"
		)
		XCTAssertEqual(
			sections.count,
			2,
			"Некорректное кол-во секций"
		)
		XCTAssertEqual(
			sections[0],
			.uncompleted,
			"Неправильный порядок у элементов (0)"
		)
		XCTAssertEqual(
			sections[1],
			.completed,
			"Неправильный порядок у элементов (1)"
		)
	}

	func test_getTasksForSection_uncompleted() {
		_ = sectionManager.getTasksForSection(section: .uncompleted)

		XCTAssertTrue(
			taskManager.isUncompletedTaskCalled,
			"Не вызвана функция uncompletedTasks"
		)
	}

	func test_getTasksForSection_completed() {
		_ = sectionManager.getTasksForSection(section: .completed)

		XCTAssertTrue(
			taskManager.isCompletedTaskCalled,
			"Не вызвана функция completedTasks"
		)
	}

	private final class TaskManagerMock: ITaskManager {
		var isCompletedTaskCalled = false
		var isUncompletedTaskCalled = false

		func addTask(task: Task) {}
		func removeTask(task: Task) {}

		func allTasks() -> [Task] { [] }

		func completedTasks() -> [Task] {
			isCompletedTaskCalled = true
			return []
		}

		func uncompletedTasks() -> [Task] {
			isUncompletedTaskCalled = true
			return []
		}
	}
}
