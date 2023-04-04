//
//  ImportantTaskTableViewCell.swift
//  taskManager
//
//  Created by Давид Тоноян  on 12.02.2023.
//

import UIKit
import TaskManagerPackage
import PinLayout

/// Класс ячейки для важных задач.
final class ImportantTaskTableViewCell: UITableViewCell {
	static let identifier = "ImportantTaskTableViewCell"

	// MARK: - UI Elements

	lazy var taskNameLabel: UILabel = {
		let label = UILabel()
		label.font = .systemFont(ofSize: 15)

		return label
	}()

	lazy var taskDeadlineLabel: UILabel = {
		let label = UILabel()
		label.font = .systemFont(ofSize: 10)

		return label
	}()

	lazy var taskImportanceView = UIImageView()

	private lazy var backView: UIView = {
		let view = UIView()
		view.backgroundColor = Theme.white
		view.layer.cornerRadius = 10

		return view
	}()

	// MARK: - Lifecycle

	override func layoutSubviews() {
		super.layoutSubviews()

		setupHierarchy()
		setupLayout()
	}

	// MARK: - Setups

	private func setupHierarchy() {
		addSubview(backView)

		backView.addSubview(taskNameLabel)
		backView.addSubview(taskDeadlineLabel)
		backView.addSubview(taskImportanceView)
	}

	private func setupLayout() {
		let smallOffset = Constants.Offset.smallOffset
		let mediumOffset = Constants.Offset.mediumOffset
		let largeOffset = Constants.Offset.largeOffset

		backView.pin
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
			.right()
			.height(Constants.Size.labelHeight)

		taskDeadlineLabel.pin
			.left(to: taskImportanceView.edge.right)
			.marginLeft(largeOffset)
			.top(to: taskNameLabel.edge.bottom)
			.bottom()
			.right()
	}
}

/// Модель для конфигурации ячейки.
struct ImportantTaskCellModel {
	let taskStatus: TaskStatus
	let taskPriority: TaskPriority
	let taskName: String
	let taskImportanceImage = UIImage(systemName: "exclamationmark.octagon")
	let taskDeadline: String
	let taskIsOverue: Bool
}

extension ImportantTaskCellModel: ICellViewModel {
	func setup(cell: ImportantTaskTableViewCell) {
		cell.accessoryType = taskStatus == .completed ? .checkmark : .none

		cell.taskNameLabel.text = taskName
		cell.taskNameLabel.textColor = Theme.black

		cell.taskImportanceView.image = taskImportanceImage
		cell.taskImportanceView.tintColor = getImportanceColor(taskPriority: taskPriority)

		cell.taskDeadlineLabel.text = "\(taskDeadline)"
		cell.taskDeadlineLabel.textColor = Theme.red

		cell.backgroundColor = Theme.gray
	}

	private func getImportanceColor(taskPriority: TaskPriority) -> UIColor {
		switch taskPriority {
		case .low:
			return Theme.green
		case .medium:
			return Theme.yellow
		case .high:
			return Theme.red
		}
	}
}
