//
//  ImportantTaskTableViewCell.swift
//  taskManager
//
//  Created by Давид Тоноян  on 12.02.2023.
//

import UIKit
import TaskManagerPackage

/// Класс ячейки для важных задач.
final class ImportantTaskTableViewCell: UITableViewCell {
	static let identifier = "ImportantTaskTableViewCell"

	// MARK: - UI Elements

	lazy var taskNameLabel: UILabel = {
		let label = UILabel()
		label.font = .boldSystemFont(ofSize: 15)
		label.translatesAutoresizingMaskIntoConstraints = false
		label.setContentHuggingPriority(.init(250), for: .horizontal)

		return label
	}()

	lazy var taskDeadlineLabel: UILabel = {
		let label = UILabel()
		label.font = .systemFont(ofSize: 14)
		label.translatesAutoresizingMaskIntoConstraints = false

		return label
	}()

	lazy var taskImportanceView: UIImageView = {
		let imageView = UIImageView()
		imageView.translatesAutoresizingMaskIntoConstraints = false

		return imageView
	}()

	lazy var backView: UIView = {
		let view = UIView()
		view.backgroundColor = Constants.Color.white
		view.layer.cornerRadius = 10

		view.translatesAutoresizingMaskIntoConstraints = false

		return view
	}()

	// MARK: - Inits

	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)

		setupHierarchy()
		setupLayout()
	}

	@available(*, unavailable)
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
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

		NSLayoutConstraint.activate([
			backView.topAnchor.constraint(equalTo: topAnchor, constant: smallOffset),
			backView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: mediumOffset),
			backView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -mediumOffset),
			backView.bottomAnchor.constraint(equalTo: bottomAnchor),

			taskImportanceView.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: mediumOffset),
			taskImportanceView.topAnchor.constraint(equalTo: backView.topAnchor, constant: mediumOffset),
			taskImportanceView.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -mediumOffset),
			taskImportanceView.widthAnchor.constraint(equalToConstant: 20),

			taskNameLabel.leadingAnchor.constraint(equalTo: taskImportanceView.trailingAnchor, constant: mediumOffset),
			taskNameLabel.topAnchor.constraint(equalTo: backView.topAnchor, constant: smallOffset),

			taskDeadlineLabel.leadingAnchor.constraint(
				equalTo: taskImportanceView.trailingAnchor,
				constant: largeOffset
			),
			taskDeadlineLabel.topAnchor.constraint(equalTo: taskNameLabel.bottomAnchor),
			taskDeadlineLabel.bottomAnchor.constraint(equalTo: backView.bottomAnchor),
			taskDeadlineLabel.trailingAnchor.constraint(equalTo: backView.trailingAnchor)
		])
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
		cell.taskNameLabel.textColor = Constants.Color.blue

		cell.taskImportanceView.image = taskImportanceImage
		cell.taskImportanceView.tintColor = getImportanceColor(taskPriority: taskPriority)

		cell.taskDeadlineLabel.text = "\(taskDeadline)"
		cell.taskDeadlineLabel.textColor = Constants.Color.red

		if taskIsOverue {
			cell.backgroundColor = Constants.Color.lightRed
		} else {
			cell.backgroundColor = Constants.Color.blue
		}
	}

	private func getImportanceColor(taskPriority: TaskPriority) -> UIColor {
		switch taskPriority {
		case .low:
			return Constants.Color.green
		case .medium:
			return Constants.Color.yellow
		case .high:
			return Constants.Color.red
		}
	}
}
