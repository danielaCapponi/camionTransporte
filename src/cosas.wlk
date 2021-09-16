object knightRider {

	method peso() = 500

	method nivelPeligrosidad() = 10

}

object bumblebee {

	var transformadoEnAuto = true

	method peso() = 800

	method nivelPeligrosidad() {
		return if (transformadoEnAuto) {
			15
		} else {
			30
		}
	}

	method transformar() {
		transformadoEnAuto = not transformadoEnAuto
	}

}

