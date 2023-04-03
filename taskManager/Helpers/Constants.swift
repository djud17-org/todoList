//
//  Constants.swift
//  taskManager
//
//  Created by Давид Тоноян  on 12.02.2023.
//

import UIKit
import PinLayout

enum Constants {
	enum Color {
		static let blue = UIColor(red: 0, green: 0.46, blue: 0.9, alpha: 1)
		static let lightBlue = UIColor(red: 0, green: 0.46, blue: 0.9, alpha: 0.5)
		static let white: UIColor = .white

		static let red = UIColor(red: 0.97, green: 0, blue: 0, alpha: 1)
		static let lightRed = UIColor(red: 0.81, green: 0.2, blue: 0, alpha: 0.30)
		static let yellow = UIColor(red: 0.99, green: 0.66, blue: 0, alpha: 1)
		static let green = UIColor(red: 0, green: 0.6, blue: 0, alpha: 1)
	}

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
