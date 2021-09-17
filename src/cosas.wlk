object knightRider {
	method peso() = 500
	method nivelPeligrosidad() = 10
}

object bumblebee {
	var transformadoEnAuto = true
	method peso() = 800
	method nivelPeligrosidad() = if (transformadoEnAuto) {	15} else { 30 }
	
	method transformar() {
		transformadoEnAuto = !transformadoEnAuto
	}
}

object paqueteDeladrillos {
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
	method manipularMisiles() {
		tieneMisiles = !tieneMisiles
	}
	var peso() = if(tieneMisiles) {300} else {200}
	var nivelPeligrosidad() = if(tieneMisiles) {100} else {0}
}
object contenedorPortuario {
	var property cosas = []
	var peso() = 100 + cosas.sum{cosa=>cosa.peso()}
	var nivelPeligrosidad() = if(isEmpty(cosas)) { 0 } else { cosas.max{cosa=>cosa.nivelPeligrosidad()}
}

object residuosRadioactivos {
	var property peso = 0
	method nivelPeligrosidad() = 200
}

object embalajeDeSeguridad{ 
	var property cosaQueEnvuelve
	var peso() = cosaQueEnvuelve.peso()
	var nivelPeligrosidad() = cosaQueEnvuelve.nivelPeligrosidad() / 2
}
