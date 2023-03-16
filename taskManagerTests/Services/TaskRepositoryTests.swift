//
//  TaskRepositoryTests.swift
//  taskManagerTests
//
//  Created by CHURILOV DMITRIY on 15.03.2023.
//

import XCTest
@testable import taskManager

final class TaskRepositoryTests: XCTestCase {
	private var taskRepository: TaskRepository!
	
	func test_loadTasks_shouldBeSuccess() {
		
		// Arrange SUT
		taskRepository = TaskRepository()
		
		// Act
		let tasks = taskRepository.loadTasks()
		
		// Assert
		XCTAssertEqual(tasks.count, 13, "Задания не были добавлены в список")
		XCTAssertFalse(tasks.isEmpty)
	}
}
