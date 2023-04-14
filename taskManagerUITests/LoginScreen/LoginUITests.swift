//
//  LoginUITests.swift
//  taskManagerTests
//
//  Created by Давид Тоноян  on 14.04.2023.
//

import XCTest
@testable import taskManager

final class LoginUITests: XCTestCase {
	func test_login_withValidCredentials_shouldBeSuccessed() {
		let loginScreen = makeSut()

		loginScreen
			.checkIsLoginScene()
			.setInLoginTextField(login: LoginCredentials.valid.login)
			.setInPassTextField(password: LoginCredentials.valid.password)
			.tapLoginButton()
	}

	func test_login_withInValidCredentials_shouldBeSuccessed() {
		let loginScreen = makeSut()

		loginScreen
			.checkIsLoginScene()
			.setInLoginTextField(login: LoginCredentials.invalid.login)
			.setInPassTextField(password: LoginCredentials.invalid.password)
			.tapLoginButton()
			.checkIsErrorAlertShowed()
			.dismissErrorAlert()
	}
}

private extension LoginUITests {
	func makeSut() -> LoginScreenObject {
		let app = XCUIApplication()
		let loginScreen = LoginScreenObject(app: app)

		app.launch()

		return loginScreen
	}
}

private enum LoginCredentials {
	static let valid: (login: String, password: String) = ("Admin", "pa$$32!")
	static let invalid: (login: String, password: String) = ("jjj", "123")
}
