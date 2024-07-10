//
//  ViewModel.swift
//  MVX
//
//  Created by Березовский Мирослав Игоревич on 10.07.2024.
//

protocol IMVVMViewModel: AnyObject {
	
	func combineFields() -> String
}

final class MVVMViewModel {
	
	private let user: User
	
	init(user: User) {
		self.user = user
	}
}

extension MVVMViewModel: IMVVMViewModel {

	func combineFields() -> String {
		user.lastName + " " + user.firstName
	}
}
