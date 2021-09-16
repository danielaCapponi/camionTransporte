import cosas.*

object camion {

	const cosas = []

	method cargar(unaCosa) {
		cosas.add(unaCosa)
	}

	method totalBultos() = cosas.size()

	method tieneAlgoQuePesaEntre(min, max) = !cosas.isEmpty() && cosas.any({ cosa => cosa.peso().between(min, max) })

	method descargar(unaCosa) {
		cosas.remove(unaCosa)
	}

	method todoPesoPar() = !cosas.isEmpty() && cosas.all({ cosa => cosa.peso().even() })

	method hayAlgunoQuePesa(peso) = !cosas.isEmpty() && cosas.any({ cosa => cosa.peso() == peso })

	method elDeNivel(nivel) = cosas.findOrElse({ cosa => cosa.nivelPeligrosidad() == nivel }, { false })

	method pesoTotal() = cosas.sum({ cosa => cosa.peso() })

	method excedidoDePeso() = self.pesoTotal() > 2500

	method objetosQueSuperanPeligrosidad(nivel) = cosas.findOrElse({ cosa => cosa.nivelPeligrosidad() > nivel }, { false })

	method objetosMasPeligrososQue(cosaAComparar) = cosas.filtrar({ cosa => cosa.nivelDePeligrosidad() > cosaAComparar.nivelDePeligrosidad() })

}

