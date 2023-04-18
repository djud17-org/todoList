//
//  TaskListUITests.swift
//  taskManagerUITests
//
//  Created by Антон Заричный on 16.04.2023.
//

import XCTest
@testable import taskManager

final class TaskListUITests: XCTestCase {
	func test_changeStatusForImportantCell_shouldBeSuccessed() {
		let taskListScreen = makeSut()

		taskListScreen
			.checkIsTaskListScene()
			.changeStatusForImportantCell(initialCompletedStatus: false)
			.checkImportantCell(isCompleted: true)
			.changeStatusForImportantCell(initialCompletedStatus: true)
			.checkImportantCell(isCompleted: false)
	}

	func test_changeStatusForRegularCell_shouldBeSuccessed() {
		let taskListScreen = makeSut()

		taskListScreen
			.checkIsTaskListScene()
			.changeStatusStatusForRegularCell(initialCompletedStatus: false)
			.checkRegularCell(isCompleted: true)
			.changeStatusStatusForRegularCell(initialCompletedStatus: true)
			.checkRegularCell(isCompleted: false)
	}
}

private extension TaskListUITests {
	func makeSut() -> TaskListScreenObject {
		let app = XCUIApplication()
		let taskListScreen = TaskListScreenObject(app: app)

		app.launch()
		login(with: app)

		return taskListScreen
	}

	private func login(with app: XCUIApplication) {
		let loginScene = LoginScreenObject(app: app)

		loginScene
			.setInLoginTextField(login: LoginCredentials.valid.login)
			.setInPassTextField(password: LoginCredentials.valid.password)
			.tapLoginButton()
	}
}

private enum LoginCredentials {
	static let valid: (login: String, password: String) = ("Admin", "pa$$32!")
}
