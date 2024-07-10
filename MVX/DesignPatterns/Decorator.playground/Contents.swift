protocol Car {
	
	var upgrades: [String] { get }
	var price: Int { get }
}


protocol CarDecorator: Car {
	
	var car: Car { get }
}

struct BaseCar: Car {
	
	var upgrades: [String] = ["Engine"]
	
	var price: Int = 10_000
}

struct BaseWheels: CarDecorator {
	
	var car: Car
	
	var upgrades: [String] {
		car.upgrades + ["Base Wheels"]
	}
	
	var price: Int {
		car.price + 1_000
	}
}

struct AirCondition: CarDecorator {
	
	var car: Car
	
	var upgrades: [String] {
		car.upgrades + ["AirCondition"]
	}
	
	var price: Int {
		car.price + 2_000
	}
}

var car = BaseCar()
car.price
car.upgrades

var sportCar = BaseWheels(car: car)
sportCar.price
sportCar.upgrades


var airCondition = AirCondition(car: sportCar)
airCondition.price
airCondition.upgrades
