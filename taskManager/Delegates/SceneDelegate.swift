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

		window.rootViewController = assemblyLoginScreen()
		window.makeKeyAndVisible()
		self.window = window
	}
	
	private func assemblyLoginScreen() -> UIViewController {
		let storyboard = UIStoryboard(name: "LoginStoryboard", bundle: nil)
		guard let controller = storyboard.instantiateViewController(withIdentifier: "loginVC") as? LoginViewController else {
			fatalError("Нет на LoginStoryboard LoginViewController")
		}
		
		return controller
	}
}
