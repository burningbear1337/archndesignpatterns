protocol ReverseStringDelegate: AnyObject {
	
	func reverse(_ string: String) -> String
}

final class TextEditor {
	
	weak var delegate: ReverseStringDelegate?
	
	func modifyText(_ value: String) -> String {
		guard let reversedString = delegate?.reverse(value) else { return "Failed"}
		return reversedString
	}
}

final class TextManager: ReverseStringDelegate {

	func reverse(_ string: String) -> String {
		makeReversedString(string)
	}
	
	private func makeReversedString(_ value: String) -> String {
		value.map { "\($0)"}.reversed().joined()
	}
}

do {
	let textEditor = TextEditor()
	let textManager = TextManager()
	textEditor.delegate = textManager
	textEditor.modifyText("my text")
}
