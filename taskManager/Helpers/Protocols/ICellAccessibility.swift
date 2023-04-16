//
//  ICell.swift
//  taskManager
//
//  Created by Давид Тоноян  on 16.04.2023.
//

import UIKit

protocol ICellAccessibility: UITableViewCell {
	/// Настройка accessibility идентификаторов
	/// - Parameters:
	///   - indexPath: Индекс ячейки
	func setupAccessibilityIds(at indexPath: IndexPath)
}
