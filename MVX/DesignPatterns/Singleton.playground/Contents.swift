final class NetworkManager {
	
	static let shared = NetworkManager()
	
	private init() {}
	
	func loadData() -> [String] {
		return ["Dummy data"]
	}
}

final class A {
	
	private let networkManager = NetworkManager.shared
	
	private func loadData() -> [String] {
		networkManager.loadData()
	}
}


