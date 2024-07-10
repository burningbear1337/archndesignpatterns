import Foundation

struct RequestConfig {
	var path: String
	var httpMethod: String?
	var headers: [String: String]?
	var queryItems: [URLQueryItem]?
	
	init() {
		self.path = ""
	}
}

protocol IRequestBuilder: AnyObject {
	
	func reset() -> Self
	
	func httpMethod(_ value: String) -> Self
	
	func path(_ value: String) -> Self
	
	func headers(_ dict: [String: String]) -> Self
	
	func queryItems(_ dict: [String: String]) -> Self
	
	func build() -> URLRequest
}


final class RequestBuilder: IRequestBuilder {

	private var requestConfig = RequestConfig()
	
	func reset() -> Self {
		requestConfig = RequestConfig()
		return self
	}
	
	func httpMethod(_ value: String) -> Self {
		requestConfig.httpMethod = value
		return self
	}
	
	func path(_ value: String) -> Self {
		requestConfig.path = value
		return self
	}
	
	func headers(_ dict: [String : String]) -> Self {
		requestConfig.headers = dict
		return self
	}
	
	func queryItems(_ dict: [String : String]) -> Self {
		var queryItems = [URLQueryItem]()
		for (key, value) in dict {
			let queryItem = URLQueryItem(name: key, value: value)
			queryItems.append(queryItem)
		}
		requestConfig.queryItems = queryItems
		return self
	}

	
	func build() -> URLRequest {
		let url = URL(string: "https://dummyjson.com/" + requestConfig.path)!
		
		var request = URLRequest(url: url)
		
		if let httpMethod = requestConfig.httpMethod {
			request.httpMethod = httpMethod
		}
		
		if let headers = requestConfig.headers {
			headers.forEach { field, value in
				request.addValue(value, forHTTPHeaderField: field)
			}
		}

		if let queryItems = requestConfig.queryItems {
			request.url?.append(queryItems: queryItems)
		}

		return request
	}
}

struct User: Decodable {
	let id: Int
	let firstName: String
	let lastName: String

}

struct Users: Decodable {
	let users: [User]
	
	enum CodingKeys: CodingKey {
		case users
	}
	
	init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.users = try container.decode([User].self, forKey: .users)
	}
}

func loadSomeData() async {
	let request = RequestBuilder()
		.reset()
		.httpMethod("GET")
		.path("users/search")
		.queryItems(["q": "John"])
		.build()

	do {
		let (data, response) = try await URLSession.shared.data(for: request)
		let users = try JSONDecoder().decode(Users.self, from: data)
//		dump(users)
	}
	catch {
//		dump("error")
	}
}

Task {
	await loadSomeData()
}
