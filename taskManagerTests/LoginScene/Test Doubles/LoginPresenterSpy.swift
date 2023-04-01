//
//  LoginPresenterSpy.swift
//  taskManagerTests
//
//  Created by Антон Заричный on 28.03.2023.
//

@testable import taskManager

final class LoginPresenterSpy: ILoginPresentationLogic {
	// MARK: - Internal Properties

	private(set) var isCalledPresent = false

	// MARK: - Internal Methods

	func present(response: taskManager.LoginModel.Response) {
		isCalledPresent = true
	}
}
