//
//  MVPPresenter.swift
//  MVX
//
//  Created by Березовский Мирослав Игоревич on 10.07.2024.
//

protocol IMVPPresenter: AnyObject {
	
	func loadUI(ui: UI)
}

final class MVPPresenter {
	
	private weak var ui: UI?
	
	private let user: User
	
	init(user: User) {
		self.user = user
	}
}

extension MVPPresenter: IMVPPresenter {
	
	func loadUI(ui: UI) {
		self.ui = ui
		self.ui?.didTapOnLabel = { [weak self] in
			guard let self else { return }
			self.ui?.setData(self.combineFields())
		}
	}
}

private extension MVPPresenter {
	
	func combineFields() -> String {
		user.lastName + " " + user.firstName
	}
}
