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
		label.translatesAutoresizingMaskIntoConstraints = false

		return label
	}()

	lazy var backView: UIView = {
		let view = UIView()
		view.backgroundColor = Constants.Color.white
		view.layer.cornerRadius = 10

		view.translatesAutoresizingMaskIntoConstraints = false

		return view
	}()

	override func layoutSubviews() {
		super.layoutSubviews()

		setupHierarchy()
		setupLayout()
	}

	// MARK: - Setups

	private func setupHierarchy() {
		addSubview(backView)

		backView.addSubview(taskNameLabel)
	}

	private func setupLayout() {
		let smallOffset = Constants.Offset.smallOffset
		let mediumOffset = Constants.Offset.mediumOffset

		backView.pin
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
		cell.taskNameLabel.textColor = Constants.Color.blue

		cell.backgroundColor = Constants.Color.blue
	}
}
