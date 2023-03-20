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
		XCTAssertTrue(sut.taskStatus == .planned, "Неверно создается класс")
	}

	func test_deadline_setTaskLowPriority_deadlineShouldBeThreeDays() {
		let sut = ImportantTask(title: "Task", taskPriority: .low)

		let differenceDays = Calendar.current.dateComponents([.day], from: Date(), to: sut.deadLine).day!

		XCTAssertEqual(differenceDays, 3, "Неверно создается класс с low приоритетом")
	}

	func test_deadline_setTaskLowPriority_deadlineShouldBeTwoDays() {
		let sut = ImportantTask(title: "Task", taskPriority: .medium)

		let differenceDays = Calendar.current.dateComponents([.day], from: Date(), to: sut.deadLine).day!

		XCTAssertEqual(differenceDays, 2, "Неверно создается класс с medium приоритетом")
	}

	func test_deadline_setTaskLowPriority_deadlineShouldBeOneDay() {
		let sut = ImportantTask(title: "Task", taskPriority: .high)

		let differenceDays = Calendar.current.dateComponents([.day], from: Date(), to: sut.deadLine).day!

		XCTAssertEqual(differenceDays, 1, "Неверно создается класс с high приоритетом")
	}
}
