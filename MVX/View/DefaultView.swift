//
//  DefaultView.swift
//  MVX
//
//  Created by Березовский Мирослав Игоревич on 10.07.2024.
//

import UIKit

protocol UI: AnyObject {
	
	var didTapOnLabel: (() -> Void)? { get set }
	
	func setData(_ value: String)
}

final class DefaultView: UIView {
	
	var didTapOnLabel: (() -> Void)?
	
	private let label: UILabel = {
		let label = UILabel()
		label.text = "Tap to paste user"
		label.translatesAutoresizingMaskIntoConstraints = false
		label.isUserInteractionEnabled = true
		return label
	}()
	
	init() {
		super.init(frame: .zero)
		configureConstraints()
		configureGestures()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

extension DefaultView: UI {
	func setData(_ value: String) {
		self.label.text = value
	}
}

private extension DefaultView {
	
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
		didTapOnLabel?()
	}
}
