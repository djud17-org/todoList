//
//  LoginViewControllerTests.swift
//  taskManagerTests
//
//  Created by Антон Заричный on 28.03.2023.
//

import XCTest
@testable import taskManager

final class LoginViewControllerTests: XCTestCase {

	private var interactor: LoginInteractorSpy! // swiftlint:disable:this implicitly_unwrapped_optional
	private var window: UIWindow! // swiftlint:disable:this implicitly_unwrapped_optional
	private var sut: LoginViewController! // swiftlint:disable:this implicitly_unwrapped_optional

	// MARK: - Lifecycle

	override func setUp() {
		super.setUp()

		let storyboard = UIStoryboard(name: "LoginStoryboard", bundle: Bundle.main)
		sut = storyboard.instantiateViewController(identifier: "loginVC") as? LoginViewController
		interactor = LoginInteractorSpy()
		sut.interactor = interactor
		window = UIWindow()
		window.addSubview(sut.view)
		RunLoop.current.run(until: Date())
	}

	override func tearDown() {
		sut = nil
		interactor = nil
		window = nil

		super.tearDown()
	}

	// MARK: - Public Methods

	func test_render_withValidRequest_shouldLoggedIn() {
		sut.loginText = "validEmail"
		sut.passText = "validPass"

		XCTAssertTrue(interactor.isCalledLogin, "Не вызван interactor.login(:)")
	}
}

