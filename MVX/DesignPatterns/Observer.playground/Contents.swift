import Foundation

protocol Observer: AnyObject {
	
	func update(with value: String)
}

protocol Observable: AnyObject {
	
	var observers: [Observer] { get }
	
	func addObserver(_ observer: Observer)
	
	func removeObserver(_ observer: Observer)
	
	func notify(with value: String)
}

final class ObservableClass: Observable {
		
	var observers: [Observer] = []
	
	func addObserver(_ observer: Observer) {
		observers.append(observer)
	}
	
	func removeObserver(_ observer: Observer) {
		observers = observers.filter { $0 !== observer }
	}
	
	func notify(with value: String) {
		observers.forEach { observer in
			observer.update(with: value)
		}
	}
}

final class ObserverClass: Observer {
	
	var someValue: String?
	
	func update(with value: String) {
		someValue = value
	}
}

do {
	let observable = ObservableClass()
	
	let observer1 = ObserverClass()
	let observer2 = ObserverClass()
	
	observable.addObserver(observer1)
	observable.addObserver(observer2)
	
	observable.notify(with: "NEW VALUE!")
	
	observer1.someValue
	observer2.someValue
	
	observable.removeObserver(observer1)
	observable.notify(with: "ANOTHER NEW VALUE!")
	observer1.someValue
	observer2.someValue
}
