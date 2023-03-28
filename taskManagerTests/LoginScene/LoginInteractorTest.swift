//
//  LoginInteractorTest.swift
//  taskManagerTests
//
//  Created by Антон Заричный on 28.03.2023.
//

import XCTest
@testable import taskManager

final class LoginInteractorTests: XCTestCase {
	private let presenter = LoginPresenterSpy()
	private let worker = LoginWorkerSpy()

	func test_login_withValidRequest_shouldLoggedIn() {
		let sut = makeSut()
		let request = LoginModel.Request(login: "validEmail", password: "validPass")

		sut.login(request: request)

		XCTAssertTrue(worker.isCalledLogin, "Не вызван worker.login(:)")
		XCTAssertTrue(presenter.isCalledPresent, "Не вызван  presenter.present(:)")
	}
}

private extension LoginInteractorTests {
	func makeSut() -> LoginInteractor {
		LoginInteractor(worker: worker, presenter: presenter)
	}
}
