//
//  LoginPresenterSpy.swift
//  taskManagerTests
//
//  Created by Давид Тоноян  on 28.03.2023.
//

import Foundation
@testable import taskManager

final class LoginPresenterSpy: ILoginPresentationLogic {
	private(set) var isPresenterCalled = false

	func presentSomething(response: taskManager.LoginModel.Response) {
		isPresenterCalled = true
	}
}
