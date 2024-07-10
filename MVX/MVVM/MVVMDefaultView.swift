//
//  MVVMDefaultView.swift
//  MVX
//
//  Created by Березовский Мирослав Игоревич on 10.07.2024.
//

import UIKit

final class MVVMDefaultView: UIView {
	
	var didTapOnLabel: (() -> Void)?
	
	private let label: UILabel = {
		let label = UILabel()
		label.text = "Tap to paste user"
		label.translatesAutoresizingMaskIntoConstraints = false
		label.isUserInteractionEnabled = true
		return label
	}()
	
	private let vm: IMVVMViewModel
	
	init(vm: IMVVMViewModel) {
		self.vm = vm
		super.init(frame: .zero)
		configureConstraints()
		configureGestures()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

private extension MVVMDefaultView {
	
	func configureConstraints() {
		backgroundColor = .white
		
		addSubview(label)
		NSLayoutConstraint.activate([
			label.centerXAnchor.constraint(equalTo: centerXAnchor),
			label.centerYAnchor.constraint(equalTo: centerYAnchor)
		])
	}
	
	func configureGestures() {
		let gesture = UITapGestureRecognizer(target: self, action: #selector(onTap))
		label.addGestureRecognizer(gesture)
	}
	
	@objc
	func onTap() {
		label.text = vm.combineFields()
	}
}

