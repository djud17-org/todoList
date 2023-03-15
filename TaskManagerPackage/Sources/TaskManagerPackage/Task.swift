//
//  TaskManager.swift
//  taskManager
//
//  Created by Давид Тоноян  on 12.02.2023.
//

import Foundation

/// Статус задачи.
public enum TaskStatus: String {
	/// Запланирована.
	case planned

	/// Завершена.
	case completed
}

/// Модель задачи.
public class Task {
	public var title: String
	public var taskStatus: TaskStatus = .planned

	public init(title: String) {
		self.title = title
	}
}
