import cosas2.*

object camion {

	var cosas = []

	method cargar(unaCosa) {
		cosas.add(unaCosa)
		unaCosa.esCargada()
	}

	method descargar(unaCosa) {
		cosas.remove(unaCosa)
	}

	method cargarBultos(cosasACargar) {
		cosas = cosasACargar
	}

	method descargarTodo() {
		cosas.clear()
	}

	method cosas() = cosas

	method tieneAlgoQuePesaEntre(min, max) = !cosas.isEmpty() && cosas.any({ cosa => cosa.peso().between(min, max) })

	method todoPesoPar() = !cosas.isEmpty() && cosas.all{ cosa => cosa.peso().even() }

	method hayAlgunoQuePesa(peso) = !cosas.isEmpty() && cosas.any{ cosa => cosa.peso() == peso }

	// Si utilizaba el find daba error al no encontrar nada y me complicó hacer tests... ¿Está bien utilizar el findOrElse?
	method elDeNivel(nivelAEncontrar) = cosas.findOrElse({ cosa => cosa.nivelPeligrosidad() == nivelAEncontrar }, { false })

	method pesoTotal() = cosas.sum{ cosa => cosa.peso() }

	method excedidoDePeso() = self.pesoTotal() > 2500

	method objetosQueSuperanPeligrosidad(nivelPeligrosidadAComparar) = cosas.filter({ cosa => cosa.nivelPeligrosidad() > nivelPeligrosidadAComparar })

	method objetosMasPeligrososQue(cosaAComparar) = cosas.filter{ cosa => cosa.nivelPeligrosidad() > cosaAComparar.nivelPeligrosidad() }

	method superaNivelPeligrosidad(nivelPeligrosidad) = cosas.any{ cosa => cosa.nivelPeligrosidad() >= nivelPeligrosidad }

	method puedeCircularEnRuta(nivelMaximoPeligrosidad) = !self.excedidoDePeso() && !self.superaNivelPeligrosidad(nivelMaximoPeligrosidad)

	method cosaMasPesada() = cosas.max{ cosa => cosa.peso() }

	method pesos() = cosas.map{ cosa => cosa.peso() }

	method contieneCosa(cosa) {
		cosas.contains(cosa)
	}

	method totalBultos() = cosas.sum{cosa=>cosa.bultos()}

}

