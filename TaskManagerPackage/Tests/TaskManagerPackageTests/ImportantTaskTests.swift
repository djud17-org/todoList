//
//  ImportantTaskTests.swift
//  tasksTests
//
//  Created by Антон Заричный on 11.03.2023.
//

import XCTest
@testable import TaskManagerPackage

final class ImportantTaskTests: XCTestCase {

	func test_initialization_propertyTaskStatusShouldBePlanned() {
		let sut = ImportantTask(title: "Test Task", taskPriority: .medium)

		XCTAssertEqual(sut.title, "Test Task")
		XCTAssertTrue(sut.taskStatus == .planned, "Здача должна быть со статусом planned по умлочанию")
	}

	func test_deadline_setTaskLowPriority_deadlineShouldBeThreeDays() {
		let sut = ImportantTask(title: "Task", taskPriority: .low)

		let deadline = Calendar.current.dateComponents([.day], from: Date(), to: sut.deadLine).day!

		XCTAssertEqual(deadline, 3, "Deadline для задачи с low приоритетом должен быть 3 дня")
	}

	func test_deadline_setTaskLowPriority_deadlineShouldBeTwoDays() {
		let sut = ImportantTask(title: "Task", taskPriority: .medium)

		let deadline = Calendar.current.dateComponents([.day], from: Date(), to: sut.deadLine).day!

		XCTAssertEqual(deadline, 2, "Deadline для задачи с medium приоритетом должен быть 2 дня")
	}

	func test_deadline_setTaskLowPriority_deadlineShouldBeOneDay() {
		let sut = ImportantTask(title: "Task", taskPriority: .high)

		let deadline = Calendar.current.dateComponents([.day], from: Date(), to: sut.deadLine).day!

		XCTAssertEqual(deadline, 1, "Deadline для задачи с high приоритетом должен быть 1 день")
	}
}
