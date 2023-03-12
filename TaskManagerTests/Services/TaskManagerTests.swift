import XCTest
@testable import taskManager

class TaskManagerTests: XCTestCase {
	var taskManager: TaskManager!

	override func setUp() {
		super.setUp()
		taskManager = TaskManager()
	}

	override func tearDown() {
		taskManager = nil
		super.tearDown()
	}

	func test_addTask() {
		let task = Task(title: "Test Task")

		taskManager.addTask(task: task)

		XCTAssertEqual(taskManager.allTasks().count, 1)
	}

	func test_removeTask() {
		let task = Task(title: "Test Task")
		taskManager.addTask(task: task)

		taskManager.removeTask(task: task)

		XCTAssertEqual(taskManager.allTasks().count, 0)
	}

	func test_allTasks() {
		let task1 = Task(title: "Test Task 1")
		let task2 = Task(title: "Test Task 2")

		taskManager.addTask(task: task1)
		taskManager.addTask(task: task2)

		XCTAssertEqual(taskManager.allTasks().count, 2)
	}

	func test_completedTasks() {
		let task1 = Task(title: "Test Task 1")
		let task2 = Task(title: "Test Task 2")
		let task3 = Task(title: "Test Task 3")
		task1.taskStatus = .completed
		task3.taskStatus = .completed

		taskManager.addTask(task: task1)
		taskManager.addTask(task: task2)
		taskManager.addTask(task: task3)

		XCTAssertEqual(taskManager.completedTasks().count, 2)
	}

	func test_uncompletedTasks() {
		let task1 = Task(title: "Test Task 1")
		let task2 = Task(title: "Test Task 2")
		let task3 = Task(title: "Test Task 3")
		task1.taskStatus = .completed
		task3.taskStatus = .completed

		taskManager.addTask(task: task1)
		taskManager.addTask(task: task2)
		taskManager.addTask(task: task3)

		XCTAssertEqual(taskManager.uncompletedTasks().count, 1)
	}
}
