//
//  LoginInteractorSpy.swift
//  taskManagerTests
//
//  Created by Антон Заричный on 28.03.2023.
//

@testable import taskManager

final class LoginInteractorSpy: ILoginBusinessLogic {
	// MARK: - Internal Properties

	private(set) var isCalledLogin = false

	// MARK: - Internal Methods

	func login(request: taskManager.LoginModel.Request) {
		isCalledLogin = true
	}
}
