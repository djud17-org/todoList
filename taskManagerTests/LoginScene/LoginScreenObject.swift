//
//  LoginScreenObject.swift
//  taskManagerTests
//
//  Created by Антон Заричный on 10.04.2023.
//

import taskManager

class LoginScreenObject: BaseScreenObject {
	lazy var loginTextField = app.textFields[LoginSceneAccessibilityId.loginTextField.rawValue]
	lazy var passTextField = app.textFields[LoginSceneAccessibilityId.passwordTextField.rawValue]
	lazy var loginButton = app.buttons[LoginSceneAccessibilityId.loginButton.rawValue]

	func isLoginScene() {
		assert(loginTextField, [.exists])
		assert(passTextField, [.exists])
		assert(loginButton, [.exists])
	}

	func set(login: String) {
		loginTextField.tap()
		loginTextField.typeText(login)
	}

	func set(password: String) {
		passTextField.tap()
		passTextField.typeText(password)
	}

	func login() {
		loginButton.tap()
	}
}
