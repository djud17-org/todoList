//
//  LoginScreenObject.swift
//  taskManagerTests
//
//  Created by Антон Заричный on 10.04.2023.
//

final class LoginScreenObject: BaseScreenObject {

	// MARK: - UI Elements

	private lazy var loginTextField = app.textFields[LoginSceneAccessibilityId.loginTextField.rawValue]
	private lazy var passTextField = app.textFields[LoginSceneAccessibilityId.passwordTextField.rawValue]
	private lazy var loginButton = app.buttons[LoginSceneAccessibilityId.loginButton.rawValue]

	private lazy var errorAlert = app.alerts.firstMatch
	private lazy var alertOkButton = errorAlert.buttons.firstMatch

	// MARK: - Check funcs

	///  Функция для проверки логин сцены
	@discardableResult
	func checkIsLoginScene() -> Self {
		assertElement(loginTextField, [.exists])
		assertElement(passTextField, [.exists])
		assertElement(loginButton, [.exists])

		return self
	}

	/// Функция для установки логина
	@discardableResult
	func setInLoginTextField(login: String) -> Self {
		loginTextField.tap()
		loginTextField.typeText(login)

		return self
	}

	/// Функция для установки пароля
	@discardableResult
	func setInPassTextField(password: String) -> Self {
		passTextField.tap()
		passTextField.typeText(password)

		return self
	}

	/// Функция для нажатия кнопки login на логин сцене
	@discardableResult
	func tapLoginButton() -> Self {
		loginButton.tap()

		return self
	}

	/// Функция для проверки появлении сообщения об ошибке при ошибке авторизации
	@discardableResult
	func checkIsErrorAlertShowed() -> Self {
		assertElement(errorAlert, [.exists])

		return self
	}

	/// Функция для проверки исчезновения сообщения об ошибке авторизации
	@discardableResult
	func dismissErrorAlert() -> Self {
		assertElement(errorAlert, [.exists])
		alertOkButton.tap()
		assertElement(errorAlert, [.doesNotExist])

		return self
	}
}
