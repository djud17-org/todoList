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
}

protocol ICellViewModel: ICellViewAnyModel {
	associatedtype CellType: UIView

	/// Настройка ячейки.
	/// - Parameter cell: Ячейка таблицы.
	func setup(cell: CellType)
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
}
