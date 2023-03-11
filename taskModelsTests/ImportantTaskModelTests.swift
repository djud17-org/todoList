//
//  ImportantTaskModelTests.swift
//  taskModelsTests
//
//  Created by Антон Заричный on 11.03.2023.
//

import XCTest
@testable import taskManager

final class ImportantTaskModelTests: XCTestCase {

	func test_taskStatus_initialPlannedStatus() {
		let sut = ImportantTask(title: "Task", taskPriority: .low)
		XCTAssertTrue(sut.taskStatus == .planned)
	}

	func test_deadline_withTaskLowPriority() {
		let sut = ImportantTask(title: "Task", taskPriority: .low)
		let date = Calendar.current.date(byAdding: .day, value: 3, to: Date())!

		XCTAssertEqual(
			sut.deadLine.formatted(date: .numeric, time: .omitted),
			date.formatted(date: .numeric, time: .omitted)
		)
	}

	func test_deadline_withTaskMediumPriority() {
		let sut = ImportantTask(title: "Task", taskPriority: .medium)
		let date = Calendar.current.date(byAdding: .day, value: 2, to: Date())!

		XCTAssertEqual(
			sut.deadLine.formatted(date: .numeric, time: .omitted),
			date.formatted(date: .numeric, time: .omitted)
		)
	}

	func test_deadline_withTaskHighPriority() {
		let sut = ImportantTask(title: "Task", taskPriority: .high)
		let date = Calendar.current.date(byAdding: .day, value: 1, to: Date())!
		
		XCTAssertEqual(
			sut.deadLine.formatted(date: .numeric, time: .omitted),
			date.formatted(date: .numeric, time: .omitted)
		)
	}
}
