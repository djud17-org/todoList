//
//  SectionManagerSpy.swift
//  taskManagerTests
//
//  Created by Давид Тоноян  on 30.03.2023.
//

@testable import taskManager
@testable import TaskManagerPackage

final class SectionForTaskManagerAdapterSpy: ISectionForTaskManagerAdapter {
	private(set) var isGetSectionsCalled = false
	private(set) var isGetTasksForSection = false

	private let testTask: Task = .init(title: "Test task")
	var taskStatus: TaskStatus {
		testTask.taskStatus
	}

	func getSections() -> [Section] {
		isGetSectionsCalled = true

		return [.completed]
	}

	func getTasksForSection(section: Section) -> [Task] {
		isGetTasksForSection = true
		switch section {
		case .completed:
			return [testTask]
		case .uncompleted:
			return []
		}
	}
}
