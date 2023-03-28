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
		let storyboard = UIStoryboard(name: "LoginStoryboard", bundle: nil)
		guard let viewController = storyboard
			.instantiateViewController(withIdentifier: "loginVC") as? LoginViewController
		else {
			fatalError("Нет на LoginStoryboard LoginViewController")
		}

		let worker = LoginWorker()
		let presenter = LoginPresenter()
		let interactor = LoginInteractor(presenter: presenter, worker: worker)

		viewController.interactor = interactor
		presenter.viewController = viewController

		return viewController
	}
}
