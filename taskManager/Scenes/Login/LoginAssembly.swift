//
//  LoginAssembly.swift
//  taskManager
//
//  Created by Давид Тоноян  on 09.03.2023.
//

import UIKit

protocol IAssembly {

	/// Функция сборки модуля.
	/// - Returns: Контроллер.
	func assembly() -> UIViewController
}

final class LoginAssembly: IAssembly {
	func assembly() -> UIViewController {
		let presenter = LoginPresenter()
		let worker = LoginWorker()
		let interactor = LoginInteractor(worker: worker, presenter: presenter)
		let loginController = LoginViewController(interactor: interactor)
		presenter.viewController = loginController

		return loginController
	}
}
