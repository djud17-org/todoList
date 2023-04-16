//
//  ImportantTaskCellModel.swift
//  taskManager
//
//  Created by Давид Тоноян  on 16.04.2023.
//

import TaskManagerPackage
import UIKit

/// Модель для конфигурации ячейки.
struct ImportantTaskCellModel {
	let taskStatus: TaskStatus
	let taskPriority: TaskPriority
	let taskName: String
	let taskImportanceImage = UIImage(systemName: "exclamationmark.octagon")
	let taskDeadline: String
	let taskIsOverdue: Bool
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
