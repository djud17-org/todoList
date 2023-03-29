//
//  LoginWorkerSpy.swift
//  taskManagerTests
//
//  Created by Давид Тоноян  on 28.03.2023.
//

import Foundation
@testable import taskManager

final class LoginWorkerSpy: ILoginWorker {
	private(set) var isLoginWorkerCalled = false

	func login(login: taskManager.Login, password: taskManager.Password) -> Bool {
		isLoginWorkerCalled = true

		return true
	}
}
