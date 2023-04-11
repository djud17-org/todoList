//
//  LoginScreenObject.swift
//  taskManagerTests
//
//  Created by Антон Заричный on 10.04.2023.
//

import taskManager

final class LoginScreenObject: BaseScreenObject {
	lazy var loginTextField = app.textFields[LoginSceneAccessibilityId.loginTextField.rawValue]
	lazy var passTextField = app.textFields[LoginSceneAccessibilityId.passwordTextField.rawValue]
	lazy var loginButton = app.buttons[LoginSceneAccessibilityId.loginButton.rawValue]
	///  Функция для проверки логин сцены
	func checkIsLoginScene() {
		assert(loginTextField, [.exists])
		assert(passTextField, [.exists])
		assert(loginButton, [.exists])
	}
	/// Функция для установки логина
	func set(login: String) {
		loginTextField.tap()
		loginTextField.typeText(login)
	}
	/// Функция для установки пароля
	func set(password: String) {
		passTextField.tap()
		passTextField.typeText(password)
	}
	/// Функция для нажатия кнопки login на логин сцене
	func tapLoginButton() {
		loginButton.tap()
	}
}
