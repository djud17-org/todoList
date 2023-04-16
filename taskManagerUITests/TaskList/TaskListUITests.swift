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

		login()

		taskListScreen
			.checkIsTaskListScene()
			.changeStatusForImportantCell()
	}

	func test_changeStatusForRegularCell_shouldBeSuccessed() {
		let taskListScreen = makeSut()

		login()

		taskListScreen
			.checkIsTaskListScene()
			.changeStatusForRegularCell()
	}
}

private extension TaskListUITests {
	func makeSut() -> TaskListScreenObject {
		let app = XCUIApplication()
		let taskListScreen = TaskListScreenObject(app: app)

		app.launch()

		return taskListScreen
	}

	func login() {
		let app = XCUIApplication()
		let loginScene = LoginScreenObject(app: app)

		loginScene
			.setInLoginTextField(login: LoginCredentials.valid.login)
			.setInPassTextField(password: LoginCredentials.valid.password)
			.tapLoginButton()
	}
}

private enum LoginCredentials {
	static let valid: (login: String, password: String) = ("Admin", "pa$$32!")
	static let invalid: (login: String, password: String) = ("jjj", "123")
}
