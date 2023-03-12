//
//  UITableView.swift
//  taskManager
//
//  Created by Давид Тоноян  on 12.02.2023.
//

import UIKit

extension UITableView {
	/// Конфигурация переиспользуемой ячейки с помощью модели ячейки.
	/// - Parameters:
	///   - model: модель используемой ячейки таблицы.
	///   - indexPath: индекс ячейки таблицы.
	/// - Returns: Собранная ячейка таблицы.
	func dequeueReusableCell(withModel model: ICellViewAnyModel, for indexPath: IndexPath) -> UITableViewCell {
		let identifier = String(describing: type(of: model).cellAnyType)
		let cell = dequeueReusableCell(withIdentifier: identifier, for: indexPath)
		model.setupAny(cell: cell)

		return cell
	}
}
