object knightRider {

	method peso() = 500

	method nivelPeligrosidad() = 10

	method esCargada() {
	}

	method bultos() = 1

}

object bumblebee {

	var transformadoEnAuto = true

	method peso() = 800

	method nivelPeligrosidad() = if (transformadoEnAuto) {
		15
	} else {
		30
	}

	method transformar() {
		transformadoEnAuto = !transformadoEnAuto
	}

	method estaTransformadoEnAuto() = transformadoEnAuto

	method esCargada() {
		if (self.estaTransformadoEnAuto()) {
			self.transformar()
		}
	}

	method bultos() = 2

}

object paqueteDeLadrillos {

	var property cantidadDeLadrillos = 0

	method peso() = 2 * cantidadDeLadrillos

	method nivelPeligrosidad() = 2

	method esCargada() {
		self.cantidadDeLadrillos(cantidadDeLadrillos + 12)
	}

	method bultos() {
		var bultos = 0
		if (cantidadDeLadrillos > 300) {
			bultos = 3
		} else if (cantidadDeLadrillos.between(101, 300)) {
			bultos = 2
		} else if (cantidadDeLadrillos > 0) {
			bultos = 1
		}
		return bultos
	}

}

object arenaAGranel {

	var property peso = 0

	method nivelPeligrosidad() = 1

	method esCargada() {
		self.peso(peso + 20)
	}

	method bultos() = 1

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

	method esCargada() {
		if (!self.tieneMisiles()) {
			self.manipularMisiles()
		}
	}

	method bultos() = if (self.tieneMisiles()) {
		2
	} else {
		1
	}

}

object contenedorPortuario {

	var property cosas = [ bultoVacio ]

	method vaciar() {
		cosas.clear()
	}

	method peso() = 100 + cosas.sum{ cosa => cosa.peso() }

	method nivelPeligrosidad() = if (cosas.isEmpty()) {
		0
	} else {
		cosas.max({ cosa => cosa.nivelPeligrosidad()}).nivelPeligrosidad()
	}

	method esCargada() {
		cosas.forEach({ cosa => cosa.esCargada()})
	}

	method bultos() = 1 + cosas.sum{ cosa => cosa.bultos() }

}

object residuosRadioactivos {

	var property peso = 0

	method nivelPeligrosidad() = 200

	method esCargada() {
		self.peso(peso + 15)
	}

	method bultos() = 1

}

object embalajeDeSeguridad {

	var property cosaQueEnvuelve = bultoVacio

	method peso() = cosaQueEnvuelve.peso()

	method nivelPeligrosidad() = cosaQueEnvuelve.nivelPeligrosidad() / 2

	method esCargada() {
	}

	method bultos() = 2

}

object bultoVacio {

	method peso() = 0

	method nivelPeligrosidad() = 0

	method esCargada() {
	}

	method bultos() = 0

}

