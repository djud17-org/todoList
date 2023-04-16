//
//  RegularTaskCellModel.swift
//  taskManager
//
//  Created by Давид Тоноян  on 16.04.2023.
//

import TaskManagerPackage

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
}
