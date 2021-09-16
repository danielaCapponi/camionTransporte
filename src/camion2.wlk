import cosas.*

object camion {

	const property cosas = []

	method cargar(unaCosa) {
		cosas.add(unaCosa)
	}

	method totalBultos() = cosas.size()

	method tieneAlgoQuePesaEntre(min, max) {
		return cosas.any({ cosa => cosa.peso().between(min, max) })
	}

}

