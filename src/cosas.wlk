object knightRider {

	method peso() = 500

	method nivelPeligrosidad() = 10

}

object bumblebee {

	var transformadoEnAuto = true

	method peso() = 800

	method nivelPeligrosidad() = if (transformadoEnAuto) {
		15
	} else {
		30
	}

	method estaTransformadoEnAuto() = transformadoEnAuto

	method transformar() {
		transformadoEnAuto = !transformadoEnAuto
	}

}

object paqueteDeLadrillos {

	var property cantidadDeLadrillos = 0

	method peso() = 2 * cantidadDeLadrillos

	method nivelPeligrosidad() = 2

}

object arenaAGranel {

	var property peso = 0

	method nivelPeligrosidad() = 1

}

object bateriaAntiaerea {

	var tieneMisiles = false

	method tieneMisiles() = tieneMisiles

	method manipularMisiles() {
		tieneMisiles = !tieneMisiles
	}

	method peso() = if (tieneMisiles) {
		300
	} else {
		200
	}

	method nivelPeligrosidad() = if (tieneMisiles) {
		100
	} else {
		0
	}

}

object contenedorPortuario {

	var property cosas = []

	method vaciar() {
		cosas.clear()
	}

	method peso() = 100 + cosas.sum{ cosa => cosa.peso() }

	method nivelPeligrosidad() = if (cosas.isEmpty()) {
		0
	} else {
		cosas.max({ cosa => cosa.nivelPeligrosidad()}).nivelPeligrosidad()
	}

}

object residuosRadioactivos {

	var property peso = 0

	method nivelPeligrosidad() = 200

}

object embalajeDeSeguridad {

	var property cosaQueEnvuelve

	method peso() = cosaQueEnvuelve.peso()

	method nivelPeligrosidad() = cosaQueEnvuelve.nivelPeligrosidad() / 2

}

