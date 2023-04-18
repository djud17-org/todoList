//
//  TaskListScreenObject.swift
//  taskManager
//
//  Created by Давид Тоноян  on 16.04.2023.
//

import XCTest

final class TaskListScreenObject: BaseScreenObject {
	// MARK: - UI Elements

	private lazy var tableView = app.tables[TaskListSceneAccessibilityId.tableView.rawValue]
	private lazy var firstSection = app.staticTexts[L10n.Section.CompletedTasks.title]
	private lazy var secondSection = app.staticTexts[L10n.Section.UncompletedTasks.title]

	private lazy var uncompletedRegularCell = TestCell(app: app, cellType: .regular, isCompleted: false)
	private lazy var completedRegularCell = TestCell(app: app, cellType: .regular, isCompleted: true)

	private lazy var uncompletedImportantCell = TestCell(app: app, cellType: .important, isCompleted: false)
	private lazy var completedImportantCell = TestCell(app: app, cellType: .important, isCompleted: true)

	// MARK: - Check funcs

	///  Функция для проверки сцены
	@discardableResult
	func checkIsTaskListScene() -> Self {
		assertElement(tableView, [.exists])
		assertElement(firstSection, [.exists])
		assertElement(secondSection, [.exists])

		checkImportantCell(isCompleted: false)
		checkRegularCell(isCompleted: false)

		return self
	}

	/// Функция для установки статуса выполнено для задачи с приоритетом
	@discardableResult
	func changeStatusForImportantCell(initialCompletedStatus: Bool) -> Self {
		var importantCell = initialCompletedStatus ? completedImportantCell : uncompletedImportantCell

		assertElement(importantCell.cell, [.exists])
		importantCell.cell.tap()

		return self
	}

	/// Функция для установки статуса выполнено для обычной задачи
	@discardableResult
	func changeStatusStatusForRegularCell(initialCompletedStatus: Bool) -> Self {
		var regularCell = initialCompletedStatus ? completedRegularCell : uncompletedRegularCell

		assertElement(regularCell.cell, [.exists])
		regularCell.cell.tap()

		return self
	}

	/// Функция для проверки ячейки важной задачи
	@discardableResult
	func checkImportantCell(isCompleted: Bool) -> Self {
		var importantCell = isCompleted ? completedImportantCell : uncompletedImportantCell
		assertElement(importantCell.cell, [.exists])
		assertElement(importantCell.cellNameLabel, [.exists])
		assertElement(importantCell.cellDeadlineLabel, [.exists])
		assertElement(importantCell.cellImportanceView, [.exists])
		XCTAssertEqual(importantCell.cell.isSelected, isCompleted)

		return self
	}

	/// Функция для проверки ячейки обычной задачи
	@discardableResult
	func checkRegularCell(isCompleted: Bool) -> Self {
		var regularCell = isCompleted ? completedRegularCell : uncompletedRegularCell
		assertElement(regularCell.cell, [.exists])
		assertElement(regularCell.cellNameLabel, [.exists])
		XCTAssertEqual(regularCell.cell.isSelected, isCompleted)

		return self
	}
}
// MARK: - TestCell

private struct TestCell {
	private let app: XCUIApplication
	private let cellType: CellType
	private let isCompleted: Bool

	private var cellId: TaskListSceneAccessibilityId {
		switch cellType {
		case .regular:
			return .regularCell
		case .important:
			return .importantCell
		}
	}

	private var cellIndex: String {
		switch cellType {
		case .regular:
			return isCompleted ? "1_0" : "0_7"
		case .important:
			return isCompleted ? "1_0" : "0_0"
		}
	}

	enum CellType {
		case regular
		case important
	}

	init(app: XCUIApplication, cellType: CellType, isCompleted: Bool) {
		self.app = app
		self.cellType = cellType
		self.isCompleted = isCompleted
	}

	lazy var cell = app.tables.cells[
		"\(cellId)_\(cellIndex)"
	]

	lazy var cellNameLabel = app.staticTexts[
		"\(cellId)_\(TaskListSceneAccessibilityId.taskNameLabel)_\(cellIndex)"
	]
	lazy var cellDeadlineLabel = app.staticTexts[
		"\(cellId)_\(TaskListSceneAccessibilityId.taskDeadlineLabel)_\(cellIndex)"
	]
	lazy var cellImportanceView = app.images[
		"\(cellId)_\(TaskListSceneAccessibilityId.taskImportanceView)_\(cellIndex)"
	]
}
