import cosas.*

object camion {

	const cosas = []

	method cargar(unaCosa) {
		cosas.add(unaCosa)
	}

	method descargar(unaCosa) {
		cosas.remove(unaCosa)
	}

	method totalBultos() = cosas.size()

	method tieneAlgoQuePesaEntre(min, max) = !cosas.isEmpty() && cosas.any({ cosa => cosa.peso().between(min, max) })

	method todoPesoPar() = !cosas.isEmpty() && cosas.all{ cosa => cosa.peso().even() }

	method hayAlgunoQuePesa(peso) = !cosas.isEmpty() && cosas.any{ cosa => cosa.peso() == peso }

	// Si utilizaba el find daba error al no encontrar nada... ¿Está bien esta implementación del findOrElse?
	method elDeNivel(nivelAEncontrar) = cosas.findOrElse({ cosa => cosa.nivelPeligrosidad() == nivelAEncontrar }, { false })

	method pesoTotal() = cosas.sum{ cosa => cosa.peso() }

	method excedidoDePeso() = self.pesoTotal() > 2500

	method objetosQueSuperanPeligrosidad(nivelPeligrosidadAComparar) = cosas.filter({ cosa => cosa.nivelPeligrosidad() > nivelPeligrosidadAComparar })

	method objetosMasPeligrososQue(cosaAComparar) = cosas.filter{ cosa => cosa.nivelPeligrosidad() > cosaAComparar.nivelPeligrosidad() }

	method superaNivelPeligrosidad(nivelPeligrosidad) = cosas.any{ cosa => cosa.nivelPeligrosidad() >= nivelPeligrosidad }

	method puedeCircularEnRuta(nivelMaximoPeligrosidad) = !self.excedidoDePeso() && !self.superaNivelPeligrosidad(nivelMaximoPeligrosidad)

	method cosaMasPesada() = cosas.max{ cosa => cosa.peso() }

	method pesos() = cosas.map{ cosa => cosa.peso() }

}

