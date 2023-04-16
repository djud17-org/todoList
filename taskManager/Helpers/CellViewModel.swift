//
//  CellViewModel.swift
//  taskManager
//
//  Created by Давид Тоноян  on 12.02.2023.
//

import UIKit

protocol ICellViewAnyModel {
	static var cellAnyType: UIView.Type { get }

	/// Настройка ячейки.
	/// - Parameter cell: Ячейка таблицы.
	func setupAny(cell: UIView)

	/// Настройка accessibility идентификаторов
	/// - Parameters:
	///   - cell: Ячейка таблицы
	///   - indexPath: Индекс ячейки
	func setupAnyAccessibilityIds(for cell: UIView, at indexPath: IndexPath)
}

protocol ICellViewModel: ICellViewAnyModel {
	associatedtype CellType: UIView

	/// Настройка ячейки.
	/// - Parameter cell: Ячейка таблицы.
	func setup(cell: CellType)

	/// Настройка accessibility идентификаторов
	/// - Parameters:
	///   - cell: Ячейка таблицы
	///   - indexPath: Индекс ячейки
	func setupAccessibilityIds(for cell: CellType, at indexPath: IndexPath)
}

extension ICellViewModel {
	static var cellAnyType: UIView.Type { CellType.self }

	func setupAny(cell: UIView) {
		guard let cell = cell as? CellType else {
			assertionFailure("Cann`t setup cell")
			return
		}

		setup(cell: cell)
	}

	func setupAnyAccessibilityIds(for cell: UIView, at indexPath: IndexPath) {
		guard let cell = cell as? CellType else {
			assertionFailure("Cann`t setup accessibilityIds")
			return
		}

		setupAccessibilityIds(for: cell, at: indexPath)
	}
}
