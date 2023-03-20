//
//  SectionManager.swift
//  taskManager
//
//  Created by Давид Тоноян  on 18.02.2023.
//

import XCTest
@testable import TaskManagerPackage

final class TaskManagerTests: XCTestCase {
	private let taskManager = TaskManager()

	func test_addTask_taskShouldBeAdded() {
		let task = Task(title: "Test Task")

		taskManager.addTask(task: task)
		let tasks = taskManager.allTasks()

		XCTAssertFalse(tasks.isEmpty, "Задача не добавлена, список задач пустой")
		XCTAssertEqual(tasks.count, 1, "Добавлено некорректное кол-во задач - \(tasks.count)")
	}

	func test_removeTask_taskShouldBeRemoved() {
		let task = Task(title: "Test Task")
		taskManager.addTask(task: task)

		taskManager.removeTask(task: task)

		let tasks = taskManager.allTasks()
		XCTAssertTrue(tasks.isEmpty, "Задача не была удалена, список задач не пустой")
	}

	func test_allTasks_shouldReturnAllTasks() {
		let task1 = Task(title: "Test Task 1")
		let task2 = Task(title: "Test Task 2")

		taskManager.addTask(task: task1)
		taskManager.addTask(task: task2)

		let tasks = taskManager.allTasks()

		XCTAssertFalse(tasks.isEmpty, "Список задач пустой")
		XCTAssertEqual(tasks.count, 2, "Вернулось некорректное кол-во задач - \(tasks.count)")
	}

	func test_completedTasks_shouldReturnCompletedTasks() {
		let task1 = Task(title: "Test Task 1")
		let task2 = Task(title: "Test Task 2")
		let task3 = Task(title: "Test Task 3")
		task1.taskStatus = .completed
		task3.taskStatus = .completed

		taskManager.addTask(task: task1)
		taskManager.addTask(task: task2)
		taskManager.addTask(task: task3)

		let completedTasks = taskManager.completedTasks()
		XCTAssertFalse(completedTasks.isEmpty, "Список выполненных задач пустой")
		XCTAssertEqual(completedTasks.count, 2, "Вернулось некорректное кол-во задач - \(completedTasks.count)")
		XCTAssertEqual(completedTasks[0].taskStatus, .completed, "Задача (0) с некорректным статусом")
		XCTAssertEqual(completedTasks[1].taskStatus, .completed, "Задача (1) с некорректным статусом")
	}

	func test_uncompletedTasks_shouldReturnUncompletedTasks() {
		let task1 = Task(title: "Test Task 1")
		let task2 = Task(title: "Test Task 2")
		let task3 = Task(title: "Test Task 3")
		task1.taskStatus = .completed
		task3.taskStatus = .completed

		taskManager.addTask(task: task1)
		taskManager.addTask(task: task2)
		taskManager.addTask(task: task3)

		let uncompletedTasks = taskManager.uncompletedTasks()
		XCTAssertFalse(uncompletedTasks.isEmpty, "Список невыполненных задач пустой")
		XCTAssertEqual(uncompletedTasks.count, 1, "Вернулось некорректное кол-во задач - \(uncompletedTasks.count)")
		XCTAssertEqual(uncompletedTasks[0].taskStatus, .planned, "Задача (0) с некорректным статусом")
	}
}
