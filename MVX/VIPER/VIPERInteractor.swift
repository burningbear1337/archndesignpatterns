//
//  VIPERInteractor.swift
//  MVX
//
//  Created by Березовский Мирослав Игоревич on 10.07.2024.
//

protocol IVIPERInteractor: AnyObject {
	
	func combineFields() -> String
}

final class VIPERInteractor: IVIPERInteractor {
	
	private let user: User
	
	init(user: User) {
		self.user = user
	}
	
	func combineFields() -> String {
		user.lastName + " " + user.firstName
	}
}
