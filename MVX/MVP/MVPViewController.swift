//
//  MVPViewController.swift
//  MVX
//
//  Created by Березовский Мирослав Игоревич on 10.07.2024.
//

import UIKit

final class MVPViewController: UIViewController {
	
	private let ui = DefaultView()
	private let presenter: IMVPPresenter
	
	init(presenter: IMVPPresenter) {
		self.presenter = presenter
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
		self.presenter.loadUI(ui: ui)
	}
}
