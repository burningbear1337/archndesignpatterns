//
//  VIPERRouter.swift
//  MVX
//
//  Created by Березовский Мирослав Игоревич on 10.07.2024.
//

import UIKit

protocol IVIPERRouter: AnyObject {
	
	func setVC(_ viewController: UIViewController)
	func routeToDetails()
}

final class VIPERRouter {
	
	private weak var vc: UIViewController?
}

extension VIPERRouter: IVIPERRouter {
	
	func setVC(_ viewController: UIViewController) {
		vc = viewController
	}

	func routeToDetails() {
		guard let vc else { return }
		let detailsVC = DetailsViewController()
		vc.navigationController?.pushViewController(detailsVC, animated: true)
	}

}
