//
//  TaskListScreenObject.swift
//  taskManager
//
//  Created by Давид Тоноян  on 16.04.2023.
//

final class TaskListScreenObject: BaseScreenObject {

	// MARK: - UI Elements

	private lazy var tableView = app.tables[TaskListSceneAccessibilityId.tableView.rawValue]
	private lazy var firstSection = app.staticTexts[L10n.Section.CompletedTasks.title]
	private lazy var secondSection = app.staticTexts[L10n.Section.UncompletedTasks.title]

	private let importantCellId = TaskListSceneAccessibilityId.importantCell
	private let importantCellIndex = "0_0"
	private lazy var firstImportantCell = app.tables.cells[
		"\(importantCellId)_\(importantCellIndex)"
	]
	private lazy var importantCellNameLabel = app.staticTexts[
		"\(importantCellId)_\(TaskListSceneAccessibilityId.taskNameLabel)_\(importantCellIndex)"
	]
	private lazy var importantCellDeadlineLabel = app.staticTexts[
		"\(importantCellId)_\(TaskListSceneAccessibilityId.taskDeadlineLabel)_\(importantCellIndex)"
	]
	private lazy var importantCellImportanceView = app.images[
		"\(importantCellId)_\(TaskListSceneAccessibilityId.taskImportanceView)_\(importantCellIndex)"
	]

	private let regularCellId = TaskListSceneAccessibilityId.regularCell
	private let regularCellIndex = "0_7"
	private lazy var firstRegularCell = app.tables.cells[
		"\(regularCellId)_\(regularCellIndex)"
	]
	private lazy var regularCellNameLabel = app.staticTexts[
		"\(regularCellId)_\(TaskListSceneAccessibilityId.taskNameLabel)_\(regularCellIndex)"
	]

	// MARK: - Check funcs

	///  Функция для проверки сцены
	@discardableResult
	func checkIsTaskListScene() -> Self {
		assertElement(tableView, [.exists])
//		assertElement(firstSection, [.exists])
//		assertElement(secondSection, [.exists])

		assertElement(firstImportantCell, [.exists])
		assertElement(importantCellNameLabel, [.exists])
		assertElement(importantCellDeadlineLabel, [.exists])
		assertElement(importantCellImportanceView, [.exists])

		assertElement(firstRegularCell, [.exists])
		assertElement(regularCellNameLabel, [.exists])

		return self
	}

	/// Функция для смены статуса для задачи с приоритетом
	@discardableResult
	func changeStatusForImportantCell() -> Self {
		firstImportantCell.tap()

		return self
	}

	/// Функция для смены статуса для обычной задачи
	@discardableResult
	func changeStatusForRegularCell() -> Self {
		firstRegularCell.tap()

		return self
	}
}
