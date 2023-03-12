import Foundation

/// Приорите задачи.
enum TaskPriority: Int {

	/// Высокий
	case high = 1

	/// Средний
	case medium = 2

	/// Низкий
	case low = 3
}

/// Модель важной задачи.
final class ImportantTask: Task {
	/// Дедлайн задачи.
	var deadLine: Date {
		let value = taskPriority.rawValue

		return Calendar.current.date(
			byAdding: .day,
			value: value,
			to: Date()
		) ?? Date()
	}

	/// Приоритет задачи.
	var taskPriority: TaskPriority

	init(title: String, taskPriority: TaskPriority) {
		self.taskPriority = taskPriority
		super.init(title: title)
	}
}
