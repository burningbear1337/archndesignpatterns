//
//  VIPERPresenter.swift
//  MVX
//
//  Created by Березовский Мирослав Игоревич on 10.07.2024.
//

import UIKit

protocol IVIPERPresenter: AnyObject {
	
	func loadUI(_ ui: UI, vc: UIViewController)
}

final class VIPERPresenter {
	
	weak var ui: UI?
	
	private let interactor: IVIPERInteractor
	private let router: IVIPERRouter
	
	init(
		interactor: IVIPERInteractor,
		router: IVIPERRouter
	) {
		self.interactor = interactor
		self.router = router
	}
}

extension VIPERPresenter: IVIPERPresenter {
	
	func loadUI(_ ui: UI, vc: UIViewController) {
		self.router.setVC(vc)
		self.ui = ui
		
		self.ui?.setData(interactor.combineFields())
		
		self.ui?.didTapOnLabel = { [weak self] in
			guard let self else { return }
			self.router.routeToDetails()
		}
	}
}
