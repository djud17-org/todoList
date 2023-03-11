//
//  SceneDelegate.swift
//  taskManager
//
//  Created by Давид Тоноян  on 12.02.2023.
//

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
	var window: UIWindow?

	func scene(
		_ scene: UIScene,
		willConnectTo session: UISceneSession,
		options connectionOptions: UIScene.ConnectionOptions
	) {
		guard let windowScene = (scene as? UIWindowScene) else { return }

		let window = UIWindow(windowScene: windowScene)

		window.rootViewController = assembly()
		window.makeKeyAndVisible()
		self.window = window
	}

	private func assembly() -> UIViewController {
		let loginController = LoginAssembly().assembly()
		let mainScreen = TaskListAssembly().assembly()

		let router = LoginRouter(
			viewController: loginController,
			mainScreen: mainScreen
		)

		if let loginController = loginController as? LoginViewController {
			loginController.router = router
		}

		return loginController
	}
}
