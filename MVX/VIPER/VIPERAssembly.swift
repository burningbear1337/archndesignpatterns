//
//  VIPERAssembly.swift
//  MVX
//
//  Created by Березовский Мирослав Игоревич on 10.07.2024.
//

import UIKit

enum VIPERAssembly {
	
	static func makeVC() -> UIViewController {
		let router = VIPERRouter()
		let interactor = VIPERInteractor(user: User(firstName: "Miroslav", lastName: "Berezovsky"))
		let presenter = VIPERPresenter(interactor: interactor, router: router)
		return VIPERViewController(presenter: presenter)
	}
}
