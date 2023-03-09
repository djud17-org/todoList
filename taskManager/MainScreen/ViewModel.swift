//
//  ViewData.swift
//  taskManager
//
//  Created by Давид Тоноян  on 22.02.2023.
//

import Foundation

enum MainModel {
	struct ViewData {
		struct RegularTask {
			let title: String
			let taskStatus: TaskStatus
		}

		struct ImportantTask {
			let title: String
			let taskStatus: TaskStatus
			let isOverdue: Bool
			let deadLine: String
			let priority: TaskPriority
		}

		enum Task {
			case regularTask(RegularTask)
			case importantTask(ImportantTask)
		}

		struct Section {
			let title: String
			let tasks: [Task]
		}

		let tasksBySections: [Section]
	}

	struct DataModel {
		let sections: [Section]
		let data: [Section: [Task]]
	}
}
