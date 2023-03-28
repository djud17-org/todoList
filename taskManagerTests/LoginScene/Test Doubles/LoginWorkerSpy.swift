//
//  LoginWorkerSpy.swift
//  taskManagerTests
//
//  Created by Антон Заричный on 28.03.2023.
//

@testable import taskManager

class LoginWorkerSpy: ILoginWorker {
	// MARK: - Internal Properties

	private(set) var isCalledLogin = false

	// MARK: - Internal Methods

	func login(login: Login, password: Password) -> Bool {
		isCalledLogin = true
		return true
	}
}
