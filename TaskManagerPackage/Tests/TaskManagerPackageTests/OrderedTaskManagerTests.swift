//
//  OrderedTaskManagerTests.swift
//  taskManagerTests
//
//  Created by CHURILOV DMITRIY on 12.03.2023.
//

import XCTest
@testable import TaskManagerPackage

final class OrderedTaskManagerTests: XCTestCase {
	private var orderedTaskManager: OrderedTaskManager!
	private var taskManager: TaskManagerMock!
	
	override func setUp() {
		taskManager = TaskManagerMock()
		orderedTaskManager = OrderedTaskManager(taskManager: taskManager)
		
		let task1 = Task(title: "Сделать сальтуху")
		let task2 = Task(title: "Зашить карманы")
		
		task1.taskStatus = .completed
		
		orderedTaskManager.addTask(task: task1)
		orderedTaskManager.addTask(task: task2)
	}
	
	override func tearDown() {
		taskManager = nil
		orderedTaskManager = nil
	}
	
	func test_singleTaskAddition() {
		
		let tasksCountAfterAdding = taskManager.allTasks().count + 1
		
		let task = RegularTask(title: "Сделать сальтуху")
		orderedTaskManager.addTask(task: task)
		
		let taskCountResult = taskManager.allTasks().count
		
		XCTAssertEqual(
			tasksCountAfterAdding,
			taskCountResult,
			"Задание не было добавлено в список"
		)
	}
	
	func test_singleTaskRemoval() {
		
		var tasks = taskManager.allTasks()
		let tasksCountAfterRemoval = taskManager.allTasks().count - 1
		
		orderedTaskManager.removeTask(task: tasks.removeLast())
		
		let taskCountResult = taskManager.allTasks().count
		
		XCTAssertEqual(
			tasksCountAfterRemoval,
			taskCountResult,
			"Задание не было удалено из списка"
		)
	}
	
	func test_allTasks_shouldBeSortedByTaskStatus() {
		
		let tasks = orderedTaskManager.allTasks()
		
		XCTAssertEqual(tasks.count, 2)
		XCTAssertTrue(tasks[0].taskStatus == .completed)
		XCTAssertTrue(tasks[1].taskStatus == .planned)
	}
	
	func test_completedTasks_shouldReturnCompletedTasks() {
		
		let tasks = orderedTaskManager.completedTasks()
		
		XCTAssertEqual(tasks.count, 1)
		XCTAssertEqual(tasks[0].taskStatus, .completed)
	}
	
	func test_uncompletedTasks_shouldReturnUncompletedTasks() {
		
		let tasks = orderedTaskManager.uncompletedTasks()
		
		XCTAssertEqual(tasks.count, 1)
		XCTAssertEqual(tasks[0].taskStatus, .planned)
	}
	
	private final class TaskManagerMock: ITaskManager {
		private var tasks = [Task]()
		
		func addTask(task: Task) {
			tasks.append(task)
		}
		
		func removeTask(task: Task) {
			tasks.removeLast()
		}
		
		func allTasks() -> [Task] {
			tasks
		}
		
		func completedTasks() -> [Task] {
			tasks.filter { $0.taskStatus == .completed }
		}
		
		func uncompletedTasks() -> [Task] {
			tasks.filter { $0.taskStatus == .planned }}
	}
}
