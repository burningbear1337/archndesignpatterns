//
//  MVVMAssembly.swift
//  MVX
//
//  Created by Березовский Мирослав Игоревич on 10.07.2024.
//

import UIKit

enum MVVMAssembly {
	
	static func makeVC() -> UIViewController {
		let vm = MVVMViewModel(user: User(firstName: "Berezovsky", lastName: "Miroslav"))
		let ui = MVVMDefaultView(vm: vm)
		return MVVMViewController(ui: ui)
	}
}
