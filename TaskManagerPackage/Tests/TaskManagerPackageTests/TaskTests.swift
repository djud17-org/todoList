//
//  taskTests.swift
//  tasksTests
//
//  Created by Антон Заричный on 11.03.2023.
//

import XCTest
@testable import TaskManagerPackage

final class TaskTests: XCTestCase {

	func test_initialization_propertyTaskStatusShouldBePlanned() {
		let sut = makeSut()

		XCTAssertEqual(sut.title, "Test Task")
		XCTAssertTrue(sut.taskStatus == .planned, "Неверно создается класс")
	}

	func test_taskStatus_setCompleted_propertyTaskStatusShouldBeCompleted() {
		let sut = makeSut()

		sut.taskStatus = .completed

		XCTAssertTrue(sut.taskStatus == .completed, "Невозможно изменить статус задачи")
	}

	private func makeSut() -> Task {
		Task(title: "Test Task")
	}
}
