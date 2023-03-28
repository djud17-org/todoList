//
//  LoginViewControllerSpy.swift
//  taskManagerTests
//
//  Created by Антон Заричный on 28.03.2023.
//

@testable import taskManager

class LoginViewControllerSpy: ILoginDisplayLogic {
	// MARK: - Internal Properties

	private(set) var isCalledRender = false
	private(set) var viewModel = false

	// MARK: - Internal Methods
	func renderData(with viewModel: taskManager.LoginModel.ViewModel) {
		isCalledRender = true

		if case .success = viewModel {
			self.viewModel = true
		}
	}
}
