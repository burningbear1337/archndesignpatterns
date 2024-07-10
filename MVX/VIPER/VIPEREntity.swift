//
//  VIPEREntity.swift
//  MVX
//
//  Created by Березовский Мирослав Игоревич on 10.07.2024.
//

struct VIPEREntity {
	
	let firstName: String
	let lastName: String
}

extension VIPEREntity {
	
	init(_ model: User) {
		self.init(firstName: model.firstName,
				  lastName: model.lastName)
	}
}
