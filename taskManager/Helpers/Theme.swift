//
//  Theme.swift
//  taskManager
//
//  Created by Антон Заричный on 04.04.2023.
//

import UIKit

enum FlatColor {
	enum Green {
		static let Fern = UIColor(hex: 0x6ABB72)
		static let MountainMeadow = UIColor(hex: 0x3ABB9D)
		static let ChateauGreen = UIColor(hex: 0x4DA664)
		static let PersianGreen = UIColor(hex: 0x2CA786)
	}

	enum Blue {
		static let PictonBlue = UIColor(hex: 0x5CADCF)
		static let Mariner = UIColor(hex: 0x3585C5)
		static let CuriousBlue = UIColor(hex: 0x4590B6)
		static let Denim = UIColor(hex: 0x2F6CAD)
		static let Chambray = UIColor(hex: 0x485675)
		static let BlueWhale = UIColor(hex: 0x29334D)
	}

	enum Violet {
		static let Wisteria = UIColor(hex: 0x9069B5)
		static let BlueGem = UIColor(hex: 0x533D7F)
	}

	enum Yellow {
		static let Energy = UIColor(hex: 0xF2D46F)
		static let Turbo = UIColor(hex: 0xF7C23E)
	}

	enum Orange {
		static let NeonCarrot = UIColor(hex: 0xF79E3D)
		static let Sun = UIColor(hex: 0xEE7841)
	}

	enum Red {
		static let TerraCotta = UIColor(hex: 0xE66B5B)
		static let Valencia = UIColor(hex: 0xCC4846)
		static let Cinnabar = UIColor(hex: 0xDC5047)
		static let WellRead = UIColor(hex: 0xB33234)
	}

	enum Gray {
		static let AlmondFrost = UIColor(hex: 0xA28F85)
		static let WhiteSmoke = UIColor(hex: 0xEFEFEF)
		static let Iron = UIColor(hex: 0xD1D5D8)
		static let IronGray = UIColor(hex: 0x75706B)
	}
}

enum Theme {
	static let red = FlatColor.Red.Cinnabar
	static let green = FlatColor.Green.ChateauGreen
	static let yellow = FlatColor.Yellow.Turbo

	static let blue = FlatColor.Blue.Mariner
	static let gray = FlatColor.Gray.Iron

	static let white = FlatColor.Gray.WhiteSmoke
	static let black = UIColor(hex: 0)
}
