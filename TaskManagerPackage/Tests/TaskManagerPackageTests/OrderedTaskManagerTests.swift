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
	
	func test_addTasks_shouldSucceed() {
		
		// arrange
		let sut = makeSut()
		
		let tasksCountAfterAdding = taskManager.allTasks().count + 1
		
		// act
		sut.addTask(task: Task(title: "Вернуться домой"))
		
		let taskCountResult = taskManager.allTasks().count
		
		// assert
		XCTAssertEqual(
			tasksCountAfterAdding,
			taskCountResult,
			"Задание не было добавлено в список"
		)
	}
	
	func test_removeTask_shouldSucceed() {
		
		// arrange
		let sut = makeSut()
		
		var tasks = taskManager.allTasks()
		let tasksCountAfterRemoval = taskManager.allTasks().count - 1
		
		// act
		sut.removeTask(task: tasks.removeLast())
		
		let taskCountResult = taskManager.allTasks().count
		
		// assert
		XCTAssertEqual(
			tasksCountAfterRemoval,
			taskCountResult,
			"Задание не было удалено из списка"
		)
	}
	
	func test_allTasks_shouldBeSortedByTaskStatus() {
		
		// arrange
		let sut = makeSut()
		
		// act
		let tasks = sut.allTasks()
		
		// assert
		XCTAssertEqual(tasks.count, 2, "Количество задание не соответствует исходному значению")
		XCTAssertTrue(tasks[0].taskStatus == .completed, "Задания не отсоритрованы по завершенным")
		XCTAssertTrue(tasks[1].taskStatus == .planned, "Задания должны быть отсортированы по завершенным")
	}
	
	func test_completedTasks_shouldReturnCompletedTasks() {
		
		// arrange
		let sut = makeSut()
		
		// act
		let tasks = sut.completedTasks()
		
		// assert
		XCTAssertEqual(tasks.count, 1, "Тестируемая функция должна возвращать только завершенные задания")
		XCTAssertEqual(tasks[0].taskStatus, .completed, "Тестируемая функция возвращает запланированные задания, вместо завершенных")
	}
	
	func test_uncompletedTasks_shouldReturnUncompletedTasks() {
		
		// arrange
		let sut = makeSut()
		
		// act
		let tasks = sut.uncompletedTasks()
		
		// assert
		XCTAssertEqual(tasks.count, 1, "Тестируемая функция должна возвращать только запланированные задания")
		XCTAssertEqual(tasks[0].taskStatus, .planned, "Тестируемая функция возвращает завершенные задания, вместо запланированных")
	}
	
	
	/// Макет класса TaskManager
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

//MARK: - Private
private extension OrderedTaskManagerTests {
	
	/// Функция производит настройку данных, необходиых для тестирования.
	/// - Returns: Экземлпяр класса OrderedTaskManager.
	private func makeSut() -> OrderedTaskManager {
		taskManager = TaskManagerMock()
		orderedTaskManager = OrderedTaskManager(taskManager: taskManager)
		
		let task1 = Task(title: "Сделать сальтуху")
		let task2 = Task(title: "Зашить карманы")
		
		task1.taskStatus = .completed
		
		orderedTaskManager.addTask(task: task1)
		orderedTaskManager.addTask(task: task2)
		
		return orderedTaskManager
	}
}


