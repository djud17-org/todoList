//
//  LoginScreenObject.swift
//  taskManagerTests
//
//  Created by Антон Заричный on 10.04.2023.
//

final class LoginScreenObject: BaseScreenObject {
	lazy var loginTextField = app.textFields[LoginSceneAccessibilityId.loginTextField.rawValue]
	lazy var passTextField = app.textFields[LoginSceneAccessibilityId.passwordTextField.rawValue]
	lazy var loginButton = app.buttons[LoginSceneAccessibilityId.loginButton.rawValue]

	lazy var errorAlert = app.alerts.firstMatch
	lazy var alertOkButton = errorAlert.buttons.firstMatch

	///  Функция для проверки логин сцены
	@discardableResult
	func checkIsLoginScene() -> Self {
		assertElement(loginTextField, [.exists])
		assertElement(passTextField, [.exists])
		assertElement(loginButton, [.exists])
	}

	/// Функция для установки логина
	@discardableResult
	func setInLoginTextField(login: String) -> Self {
		loginTextField.tap()
		loginTextField.typeText(login)
	}

	/// Функция для установки пароля
	@discardableResult
	func setInPassTextField(password: String) -> Self {
		passTextField.tap()
		passTextField.typeText(password)
	}

	/// Функция для нажатия кнопки login на логин сцене
	@discardableResult
	func tapLoginButton() -> Self {
		loginButton.tap()
	}

	/// Функция для проверки появлении сообщения об ошибке при ошибке авторизации
	@discardableResult
	func checkIsErrorAlertShowed() -> Self {
		assertElement(errorAlert, [.exists])
	}

	/// Функция для проверки исчезновения сообщения об ошибке авторизации
	@discardableResult
	func dismissErrorAlert() -> Self {
		assertElement(errorAlert, [.exists])

		alertOkButton.tap()

		assertElement(errorAlert, [.doesNotExist])
	}
}
