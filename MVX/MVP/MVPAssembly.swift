//
//  MVPAssembly.swift
//  MVX
//
//  Created by Березовский Мирослав Игоревич on 10.07.2024.
//

import UIKit

enum MVPAssembly {
	
	static func makeVC() -> UIViewController {
		let presenter = MVPPresenter(user: User(firstName: "Miroslav", lastName: "Berezovsky"))
		return MVPViewController(presenter: presenter)
	}
}
