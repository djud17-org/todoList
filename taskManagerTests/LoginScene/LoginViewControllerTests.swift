//
//  LoginViewControllerTests.swift
//  taskManagerTests
//
//  Created by Антон Заричный on 28.03.2023.
//

import XCTest
@testable import taskManager

final class LoginViewControllerTests: XCTestCase {
	private var interactor: LoginInteractorSpy!

	// MARK: - Public Methods

	func test_login_shouldCalledInteractorLogin() {
		let sut = makeSut()

		sut.loginText = "validEmail"
		sut.passText = "validPass"
		sut.login()

		XCTAssertTrue(interactor.isCalledLogin, "Не вызван interactor.login(:)")
	}
}

private extension LoginViewControllerTests {
	func makeSut() -> LoginViewController {
		interactor = LoginInteractorSpy()
		let loginViewController = LoginViewController(interactor: interactor)

		return loginViewController
	}
}
