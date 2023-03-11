//
//  LoginRouter.swift
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

@objc
protocol ILoginRoutingLogic {

	/// Функция показывает сообщение об ошибке.
	/// - Parameter errorMessage: сообщение об ошибке.
	func showError(errorMessage: String)

	/// Функция показывает главный экран.
	func navigateToMainScreen()
}

final class LoginRouter: NSObject, ILoginRoutingLogic {
	weak var viewController: UIViewController?
	let mainScreen: UIViewController

	init(viewController: UIViewController, mainScreen: UIViewController) {
		self.viewController = viewController
		self.mainScreen = mainScreen
	}

	// MARK: - Navigation

	func showError(errorMessage: String) {
		let alertController = UIAlertController(
			title: "Ошибка",
			message: errorMessage,
			preferredStyle: .alert
		)
		let okButton = UIAlertAction(title: "Ok", style: .default)
		alertController.addAction(okButton)
		viewController?.present(alertController, animated: true)
	}

	func navigateToMainScreen() {
		viewController?.present(mainScreen, animated: true)
	}
}
