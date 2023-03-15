//
//  RegularTaskTableViewCell.swift
//  taskManager
//
//  Created by Давид Тоноян  on 12.02.2023.
//

import UIKit
import TaskManagerPackage

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
	}

	private func setupLayout() {
		let smallOffset = Constants.Offset.smallOffset
		let mediumOffset = Constants.Offset.mediumOffset

		NSLayoutConstraint.activate([
			backView.topAnchor.constraint(equalTo: topAnchor, constant: smallOffset),
			backView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: mediumOffset),
			backView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -mediumOffset),
			backView.bottomAnchor.constraint(equalTo: bottomAnchor),

			taskNameLabel.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: mediumOffset),
			taskNameLabel.topAnchor.constraint(equalTo: backView.topAnchor, constant: smallOffset),
			taskNameLabel.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -mediumOffset),
			taskNameLabel.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -mediumOffset)
		])
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
