//
//  TaskRepository.swift
//  taskManager
//
//  Created by Давид Тоноян  on 15.02.2023.
//

import Foundation

protocol ITaskRepository {
	/// Метод загрузки данных
	/// - Returns: Массив задач
	func loadTasks() -> [Task]
}

/// Репозиторий для получения данных
final class TaskRepository: ITaskRepository {
	func loadTasks() -> [Task] {
		[
			RegularTask(title: "Помыть окно"),
			ImportantTask(title: "Проверить документы", taskPriority: .high),
			ImportantTask(title: "Рефакторинг проекта", taskPriority: .medium),
			ImportantTask(title: "Посмотреть WWDC", taskPriority: .low),
			ImportantTask(title: "Позвонить домой", taskPriority: .medium),
			ImportantTask(title: "Оплатить комуналку", taskPriority: .high),
			RegularTask(title: "Погулять с собакой"),
			RegularTask(title: "Почитать"),
			RegularTask(title: "Поиграть в футбол"),
			ImportantTask(title: "Встретить маму", taskPriority: .high),
			ImportantTask(title: "Купить продукты на ужин", taskPriority: .high),
			RegularTask(title: "Выбросить мусор"),
			RegularTask(title: "Убраться"),
		]
	}
}
