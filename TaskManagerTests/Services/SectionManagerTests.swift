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

		XCTAssertFalse(sections.isEmpty)
		XCTAssertTrue(sections.count == 2)
		XCTAssertTrue(sections[0] == .uncompleted)
		XCTAssertTrue(sections[1] == .completed)
	}

	func test_getTasksForSection_uncompleted() {
		_ = sectionManager.getTasksForSection(section: .uncompleted)

		XCTAssertTrue(taskManager.uncompletedTaskCalled)
	}

	func test_getTasksForSection_completed() {
		_ = sectionManager.getTasksForSection(section: .completed)

		XCTAssertTrue(taskManager.completedTaskCalled)
	}

	private final class TaskManagerMock: ITaskManager {
		var completedTaskCalled = false
		var uncompletedTaskCalled = false

		func addTask(task: taskManager.Task) {}
		func removeTask(task: taskManager.Task) {}

		func allTasks() -> [taskManager.Task] { [] }

		func completedTasks() -> [taskManager.Task] {
			completedTaskCalled = true
			return []
		}

		func uncompletedTasks() -> [taskManager.Task] {
			uncompletedTaskCalled = true
			return []
		}
	}
}
