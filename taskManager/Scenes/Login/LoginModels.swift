//
//  LoginModels.swift
//  taskManager
//
//  Created by Давид Тоноян  on 22.02.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

enum LoginModel {
	struct Request {
		let login: String
		let password: String
	}

	struct Response {
		let isLoginSuccessed: Bool
	}

	enum ViewModel {
		case success
		case failure(String)
	}
}
