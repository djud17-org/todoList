//
//  RegularTaskModelTests.swift
//  taskModelsTests
//
//  Created by Антон Заричный on 11.03.2023.
//

import XCTest
@testable import TaskManagerPackage

final class RegularTaskModelTests: XCTestCase {

	func test_taskStatus_initialPlannedStatus() {
		let sut = makeSut()
		XCTAssertTrue(sut.taskStatus == .planned)
	}

	private func makeSut() -> RegularTask {
		RegularTask(title: "Task")
	}
}
