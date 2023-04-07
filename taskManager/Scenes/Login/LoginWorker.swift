//
//  LoginWorker.swift
//  taskManager
//
//  Created by Давид Тоноян  on 22.02.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

struct Login {
	let rawValue: String

	init(rawValue: String) {
		self.rawValue = rawValue
	}
}

struct Password {
	let rawValue: String

	init(rawValue: String) {
		self.rawValue = rawValue
	}
}

/// Интерфейс работы с данными на экране авторизации.
protocol ILoginWorker {
	/// Функция валидирует логин и пароль.
	///
	/// - Parameters:
	///   - login: Логин.
	///   - password: Пароль.
	/// - Returns: Результат валидации.
	func login(login: Login, password: Password) -> Bool
}

final class LoginWorker: ILoginWorker {
	func login(login: Login, password: Password) -> Bool {
		login.rawValue == ValidCredentials.login.rawValue &&
			password.rawValue == ValidCredentials.password.rawValue
	}
}

private enum ValidCredentials: String {
	case login = "Admin"
	case password = "pa$$32!"
}
