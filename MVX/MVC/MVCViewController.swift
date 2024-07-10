//
//  MVCViewController.swift
//  MVX
//
//  Created by Березовский Мирослав Игоревич on 10.07.2024.
//

import UIKit

class MVCViewController: UIViewController {
	
	private let ui = DefaultView()
	
	private let user: User
	
	init(user: User) {
		self.user = user
		super.init(nibName: nil, bundle: nil)
		configureHandlers()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func loadView() {
		view = ui
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
}

private extension MVCViewController {
	
	func configureHandlers() {
		ui.didTapOnLabel = { [weak self] in
			guard let self else { return }
			self.ui.setData(self.combineFields())
		}
	}
	
	func combineFields() -> String {
		user.lastName + " " + user.firstName
	}
}

