//
//  LoginInteractorTests.swift
//  taskManagerTests
//
//  Created by Давид Тоноян  on 28.03.2023.
//

import XCTest
@testable import taskManager

final class LoginInteractorTests: XCTestCase {
	private let worker = LoginWorkerSpy()
	private let presenter = LoginPresenterSpy()

	func test_login_presenterAndWorkerShouldBeCalled() {
		let sut = makeSut()

		sut.login(request: .init(login: "", password: ""))

		XCTAssertTrue(worker.isLoginWorkerCalled, "Worker не был вызван")
		XCTAssertTrue(presenter.isPresenterCalled, "Presenter не был вызван")
	}
}

private extension LoginInteractorTests {
	func makeSut() -> ILoginBusinessLogic {
		let interactor = LoginInteractor(presenter: presenter, worker: worker)

		return interactor
	}
}
