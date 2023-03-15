//
//  ViewData.swift
//  taskManager
//
//  Created by Давид Тоноян  on 22.02.2023.
//

import Foundation
import TaskManagerPackage

enum TaskListModel {
	struct ViewModel {
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

	struct ResponseDataModel {
		struct SectionWithTask {
			let section: Section
			let tasks: [Task]
		}

		let sections: [SectionWithTask]
	}
}
