//
//  String+Localized.swift
//  taskManager
//
//  Created by SERGEY SHLYAKHIN on 05.04.2023.
//

import Foundation

extension String {
	var localized: String {
		return NSLocalizedString(self, comment: "")
	}
}
