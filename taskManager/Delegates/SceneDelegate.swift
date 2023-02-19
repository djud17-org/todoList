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

		let sectionManager: ISectionForTaskManagerAdapter = configureSectionManager()
		let taskListPresenter: ITaskPresenter = TaskPresenter(sectionManager: sectionManager)
		let taskListController = TaskListViewController(presenter: taskListPresenter)
		let navigationController = UINavigationController(rootViewController: taskListController)

		window.rootViewController = navigationController
		window.makeKeyAndVisible()
		self.window = window
	}

	private func configureSectionManager() -> ISectionForTaskManagerAdapter {
		let taskRepository: ITaskRepository = TaskRepository()
		let taskManager: ITaskManager = TaskManager()
		let orderedTaskManager: ITaskManager = OrderedTaskManager(taskManager: taskManager)

		let tasks = taskRepository.loadTasks()
		tasks.forEach { orderedTaskManager.addTask(task: $0) }

		let sectionManager: ISectionForTaskManagerAdapter =
			SectionForTaskManagerAdapter(taskManager: orderedTaskManager)

		return sectionManager
	}
}
