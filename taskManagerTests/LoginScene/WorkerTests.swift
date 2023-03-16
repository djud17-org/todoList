//
//  WorkerTests.swift
//  taskManagerTests
//
//  Created by Давид Тоноян  on 17.03.2023.
//

@testable import taskManager
import XCTest

final class WorkerTests: XCTestCase {
	private var loginWorker: LoginWorker!

	override func setUp() {
		loginWorker = LoginWorker()
	}

	override func tearDown() {
		loginWorker = nil
	}

	func test_loginWorker_isValidLoginAndPassword() {
		let login = Login(rawValue: "Admin")
		let pass = Password(rawValue: "pa$$32!")

		let validationResult = loginWorker.login(
			login: login,
			password: pass
		)

		XCTAssertTrue(
			validationResult,
			"Корректные логин и пароль не прошли проверку"
		)
	}

	func test_loginWorker_isInvalidLoginAndPassword() {
		let login = Login(rawValue: "NotAdmin")
		let pass = Password(rawValue: "Notpa$$32!")

		let validationResult = loginWorker.login(
			login: login,
			password: pass
		)

		XCTAssertFalse(
			validationResult,
			"Некорректные логин и пароль прошли проверку"
		)
	}

	func test_loginWorker_isValidLoginAndInvalidPassword() {
		let login = Login(rawValue: "Admin")
		let pass = Password(rawValue: "Notpa$$32!")

		let validationResult = loginWorker.login(
			login: login,
			password: pass
		)

		XCTAssertFalse(
			validationResult,
			"Корректный логин и некорректный пароль прошли проверку"
		)
	}

	func test_loginWorker_isInvalidLoginAndValidPassword() {
		let login = Login(rawValue: "NotAdmin")
		let pass = Password(rawValue: "pa$$32!")

		let validationResult = loginWorker.login(
			login: login,
			password: pass
		)

		XCTAssertFalse(
			validationResult,
			"Некорректный логин и корректный пароль прошли проверку"
		)
	}
}
