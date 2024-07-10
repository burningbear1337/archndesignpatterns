//
//  MVVMViewController.swift
//  MVX
//
//  Created by Березовский Мирослав Игоревич on 10.07.2024.
//

import UIKit

class MVVMViewController: UIViewController {
	
	private let ui: MVVMDefaultView
	
	init(ui: MVVMDefaultView) {
		self.ui = ui
		super.init(nibName: nil, bundle: nil)
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
