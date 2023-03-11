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

		let interactor = LoginInteractor()
		let presenter = LoginPresenter()
		viewController.interactor = interactor
		interactor.presenter = presenter
		presenter.viewController = viewController

		return viewController
	}
}
