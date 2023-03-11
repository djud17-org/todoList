//
//  ImportantTaskModelTests.swift
//  taskModelsTests
//
//  Created by Антон Заричный on 11.03.2023.
//

import XCTest
@testable import taskManager

final class ImportantTaskModelTests: XCTestCase {

	func test_taskHasTitle() {
		let sut = makeSut()
		XCTAssertEqual(sut.title, "Task")
	}

	func test_taskHasDefaultTaskStatus() {
		let sut = makeSut()
		XCTAssertEqual(sut.taskStatus, .planned)
	}

	func test_change_taskStatus() {
		let sut = makeSut()
		sut.taskStatus = .completed
		XCTAssertEqual(sut.taskStatus, .completed)
	}

	func test_taskHasPriority() {
		let sut = makeSut()
		XCTAssertEqual(sut.taskPriority, .high)
	}

	func test_calculate_taskDeadlineDate() {
		let sut = makeSut()
		let date = Calendar.current.date(byAdding: .day, value: 1, to: Date()) ?? Date()
		XCTAssertEqual(
			sut.deadLine.formatted(date: .numeric, time: .omitted),
			date.formatted(date: .numeric, time: .omitted))
	}

	private func makeSut() -> ImportantTask {
		ImportantTask(title: "Task", taskPriority: .high)
	}

}
