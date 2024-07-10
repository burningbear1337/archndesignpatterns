enum DeviceType {
	case ipad, iphone, imac
}

protocol AppleDevice {
	func aboutDevice() -> String
}

struct IPad: AppleDevice {
	func aboutDevice() -> String {
		return "This is iPad"
	}
}

struct IPhone: AppleDevice {
	func aboutDevice() -> String {
		return "This is iPhone"
	}
}

struct IMac: AppleDevice {
	func aboutDevice() -> String {
		return "This is iMac"
	}
}

struct AppleDeviceFactory {
	
	static func makeDevice(type: DeviceType) -> AppleDevice {
		switch type {
		case .ipad:
			IPad()
		case .iphone:
			IPhone()
		case .imac:
			IMac()
		}
	}
}

let newAppleDevice = AppleDeviceFactory.makeDevice(type: .imac)
print(newAppleDevice.aboutDevice())
