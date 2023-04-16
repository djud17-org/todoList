//
//  RegularTaskTableViewCell.swift
//  taskManager
//
//  Created by Давид Тоноян  on 12.02.2023.
//

import UIKit
import TaskManagerPackage
import PinLayout

/// Класс ячейки для обычных задач
final class RegularTaskTableViewCell: UITableViewCell {
	static let identifier = "RegularTaskTableViewCell"

	// MARK: - UI Elements

	lazy var taskNameLabel: UILabel = {
		let label = UILabel()
		label.font = .boldSystemFont(ofSize: 15)

		return label
	}()

	// MARK: - Lifecycle

	override func layoutSubviews() {
		super.layoutSubviews()

		setupContentView()
		setupLayout()
	}

	// MARK: - Setups

	private func setupContentView() {
		contentView.backgroundColor = Theme.white
		contentView.layer.cornerRadius = 10

		contentView.addSubview(taskNameLabel)
	}

	private func setupLayout() {
		let smallOffset = Constants.Offset.smallOffset
		let mediumOffset = Constants.Offset.mediumOffset

		contentView.pin
			.top(smallOffset)
			.left(mediumOffset)
			.right(mediumOffset)
			.bottom(smallOffset)

		taskNameLabel.pin
			.left(mediumOffset)
			.top(smallOffset)
			.right(mediumOffset)
			.bottom(mediumOffset)
	}
}

/// Модель для конфигурации ячейки
struct RegularTaskCellModel {
	let taskStatus: TaskStatus
	let taskName: String
}

extension RegularTaskCellModel: ICellViewModel {
	func setup(cell: RegularTaskTableViewCell) {
		cell.accessoryType = taskStatus == .completed ? .checkmark : .none

		cell.taskNameLabel.text = taskName
		cell.taskNameLabel.textColor = Theme.black

		cell.backgroundColor = Theme.gray
	}

	func setupAccessibilityIds(for cell: RegularTaskTableViewCell, at indexPath: IndexPath) {
		let indexCellMark = "\(indexPath.section)_\(indexPath.row)"
		let typeCellMark = TaskListSceneAccessibilityId.regularCell
		cell.accessibilityIdentifier = "\(typeCellMark)_\(indexCellMark)"

		cell.taskNameLabel.accessibilityIdentifier =
		"\(typeCellMark)_\(TaskListSceneAccessibilityId.taskNameLabel)_\(indexCellMark)"

		cell.accessoryView?.accessibilityIdentifier =
		"\(typeCellMark)_\(TaskListSceneAccessibilityId.checkMark)_\(indexCellMark)"
	}
}
