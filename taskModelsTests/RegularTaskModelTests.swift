//
//  RegularTaskModelTests.swift
//  taskModelsTests
//
//  Created by Антон Заричный on 11.03.2023.
//

import XCTest
@testable import taskManager

final class RegularTaskModelTests: XCTestCase {

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

	private func makeSut() -> RegularTask {
		RegularTask(title: "Task")
	}
}
