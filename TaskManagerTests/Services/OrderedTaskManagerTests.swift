//
//  OrderedTaskManagerTests.swift
//  taskManagerTests
//
//  Created by CHURILOV DMITRIY on 12.03.2023.
//

import XCTest
@testable import taskManager

final class OrderedTaskManagerTests: XCTestCase {
	private var orderedTaskManager: OrderedTaskManager!
	private var taskManager: TaskManager!
	
	override func setUp() {
		taskManager = TaskManager()
		orderedTaskManager = OrderedTaskManager(taskManager: taskManager)
		
		let task1 = Task(title: "Сделать сальтуху")
		let task2 = Task(title: "Зашить карманы")
		
		task2.taskStatus = .completed
		
		orderedTaskManager.addTask(task: task1)
		orderedTaskManager.addTask(task: task2)
	}
	
	override func tearDown() {
		taskManager = nil
		orderedTaskManager = nil
	}
	
	func test_singleTaskAddition() {
		
		// Arrange
		let tasksCountAfterAdding = taskManager.allTasks().count + 1
		
		// Act
		let task = RegularTask(title: "Сделать сальтуху")
		orderedTaskManager.addTask(task: task)
		
		// Assert
		XCTAssertEqual(
			tasksCountAfterAdding,
			taskManager.allTasks().count,
			"Задание не было добавлено в список"
		)
	}
	
	func test_singleTaskRemoval() {
		
		// Arrange
//		// Everething arranged in setUp method
		
		var tasks = taskManager.allTasks()
		let tasksCountAfterRemoval = taskManager.allTasks().count - 1
		
		// Act
		orderedTaskManager.removeTask(task: tasks.removeLast())
		
		// Assert
		XCTAssertEqual(
			tasksCountAfterRemoval,
			taskManager.allTasks().count,
			"Задание не было удалено из списка"
		)
	}
	
	func test_allTasksSorted() {
		
		// Arrange
//		// Everething arranged in setUp method
		
		// Act
		_ = orderedTaskManager.allTasks()
		
		// Assert
		XCTAssertEqual(
			orderedTaskManager.allTasks()[0].title < orderedTaskManager.allTasks()[1].title,
			orderedTaskManager.allTasks()[1].title > orderedTaskManager.allTasks()[0].title,
			"Задания не отсортированы"
		)
	}
	
	func test_ifSorted_byCompletion() {
		
		// Arrange
		// Everething arranged in setUp method
		
		// Act
		_ = orderedTaskManager.completedTasks()
		
		// Assert
		XCTAssertEqual(
			orderedTaskManager.allTasks()[0].taskStatus == .completed,
			orderedTaskManager.allTasks()[1].taskStatus == .planned,
			"Задания не отсортированы по завершенным"
		)
	}
	
	func test_ifSorted_byTasksInProgress() {
		
		// Arrange
//		// Everething arranged in setUp method
		
		// Act
		_ = orderedTaskManager.uncompletedTasks()
		
		// Assert
		XCTAssertEqual(
			orderedTaskManager.allTasks()[0].taskStatus == .planned,
			orderedTaskManager.allTasks()[1].taskStatus == .completed,
			"Список не отсортирован по заданиям в процессе выполнения"
		)
	}
}
