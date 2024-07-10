import Foundation
import UIKit

final class SomeViewController {
	
	private let myImageView = UIImageView()
	
	@MainActor func viewDidLoad() {
		SomeFacade.setImage(to: myImageView, from: "https://my-image.com/1")
	}
}


@MainActor
struct SomeFacade {
	
	static func setImage(to imageView: UIImageView, from urlString: String) {
		Task {
			do {
				let image = try await ImageLoader.loadImage(from: urlString)
				imageView.image = image
			}
			catch {
				print("Error occured: \(error)")
			}
		}
	}
}

struct ImageLoader {
	
	static func loadImage(from urlString: String) async throws -> UIImage {
		guard let url = URL(string: urlString) else {
			throw ImageLoaderError.badUrl
		}
		let (data, response) = try await URLSession.shared.data(from: url)
		guard let image = UIImage(data: data) else {
			throw ImageLoaderError.failedDecoding
		}
		return image
	}
}

enum ImageLoaderError: Error {
	case failedDecoding
	case badUrl
}
