//
//  ImportantTaskTableViewCell.swift
//  taskManager
//
//  Created by Давид Тоноян  on 12.02.2023.
//

import PinLayout
import UIKit

/// Класс ячейки для важных задач.
final class ImportantTaskTableViewCell: UITableViewCell {
	static let identifier = "ImportantTaskTableViewCell"

	// MARK: - UI Elements

	lazy var taskNameLabel: UILabel = {
		let label = UILabel()
		label.font = .boldSystemFont(ofSize: 15)

		return label
	}()

	lazy var taskDeadlineLabel: UILabel = {
		let label = UILabel()
		label.font = .systemFont(ofSize: 14)

		return label
	}()

	lazy var taskImportanceView = UIImageView()

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
		contentView.addSubview(taskDeadlineLabel)
		contentView.addSubview(taskImportanceView)
	}

	private func setupLayout() {
		let smallOffset = Constants.Offset.smallOffset
		let mediumOffset = Constants.Offset.mediumOffset
		let largeOffset = Constants.Offset.largeOffset

		contentView.pin
			.top(smallOffset)
			.left(mediumOffset)
			.right(mediumOffset)
			.bottom(smallOffset)

		taskImportanceView.pin
			.vCenter()
			.left(mediumOffset)
			.width(Constants.Size.taskImportanceViewWidth)
			.height(Constants.Size.taskImportanceViewHeight)

		taskNameLabel.pin
			.left(to: taskImportanceView.edge.right)
			.marginLeft(mediumOffset)
			.top(smallOffset)
			.right(mediumOffset)
			.height(Constants.Size.labelHeight)

		taskDeadlineLabel.pin
			.left(to: taskImportanceView.edge.right)
			.marginLeft(largeOffset)
			.top(to: taskNameLabel.edge.bottom)
			.bottom()
			.right(mediumOffset)
	}
}

extension ImportantTaskTableViewCell: ICellAccessibility {
	func setupAccessibilityIds(at indexPath: IndexPath) {
		let indexCellMark = "\(indexPath.section)_\(indexPath.row)"
		let typeCellMark = TaskListSceneAccessibilityId.importantCell
		accessibilityIdentifier = "\(typeCellMark)_\(indexCellMark)"

		taskNameLabel.accessibilityIdentifier =
			"\(typeCellMark)_\(TaskListSceneAccessibilityId.taskNameLabel)_\(indexCellMark)"

		taskDeadlineLabel.accessibilityIdentifier =
			"\(typeCellMark)_\(TaskListSceneAccessibilityId.taskDeadlineLabel)_\(indexCellMark)"

		taskImportanceView.accessibilityIdentifier =
			"\(typeCellMark)_\(TaskListSceneAccessibilityId.taskImportanceView)_\(indexCellMark)"

		accessoryView?.accessibilityIdentifier =
			"\(typeCellMark)_\(TaskListSceneAccessibilityId.checkMark)_\(indexCellMark)"
	}
}
