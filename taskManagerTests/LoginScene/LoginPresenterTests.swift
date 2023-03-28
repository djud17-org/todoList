//
//  LoginPresenterTests.swift
//  taskManagerTests
//
//  Created by Антон Заричный on 28.03.2023.
//

import XCTest
@testable import taskManager

final class LoginPresenterTests: XCTestCase {

	private let viewController = LoginViewControllerSpy()

	func test_present_withValidRequest_shouldBeRenderSuccess() {
		let sut = makeSut()
		let response = LoginModel.Response(isLoginSuccessed: true)

		sut.presentSomething(response: response)

		XCTAssertTrue(viewController.isCalledRender, "Не вызван viewController.render(:)")
		XCTAssertTrue(viewController.viewModel, "Ошибка в модели данных")
	}

	func test_present_withFailRequest_shouldBeRenderFailure() {
		let sut = makeSut()
		let response = LoginModel.Response(isLoginSuccessed: false)

		sut.presentSomething(response: response)

		XCTAssertTrue(viewController.isCalledRender, "Не вызван viewController.render(:)")
		XCTAssertFalse(viewController.viewModel, "Ошибка в модели данных")
	}
}

private extension LoginPresenterTests {
	func makeSut() -> LoginPresenter {
		LoginPresenter(viewController: viewController)
	}
}
