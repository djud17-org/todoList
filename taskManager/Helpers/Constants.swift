//
//  Constants.swift
//  taskManager
//
//  Created by Давид Тоноян  on 12.02.2023.
//

import UIKit
import PinLayout

enum Constants {
	enum Offset {
		static let smallOffset: CGFloat = 5
		static let mediumOffset: CGFloat = 10
		static let largeOffset: CGFloat = 20
	}

	enum Size {
		static let tableViewRowHeight: CGFloat = 55
		static let fieldHeight: CGFloat = 40
		static let taskImportanceViewWidth: CGFloat = 20
		static let taskImportanceViewHeight: CGFloat = 20
		static let labelHeight: CGFloat = 20
	}

	enum Padding {
		static let upperPadding: Percent = 40%
	}
}
