import cosas2.*

object camion {

	var cosas = []
	const gestionDeBultos = manejoDeBultos

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

	method totalBultos() = gestionDeBultos.calcularBultos(cosas)

}

object manejoDeBultos {

	const cosasQueSumanUnBulto = [ knightRider, arenaAGranel, residuosRadioactivos ]
	const cosasQueSumanDosBultos = [ bumblebee, embalajeDeSeguridad ]

	method calcularBultos(cosas) {
		var bultosContados = self.cantidadDeCosasQueEquivalenAUnBulto(cosas)
		bultosContados += self.cantidadDeCosasQueEquivalenADosBultos(cosas) * 2
		bultosContados += self.calcularBultosPorCosasConTratamientoEspecial(cosas)
		return bultosContados
	}

	method calcularBultosPorCosasConTratamientoEspecial(cosas) {
		var bultos = 0
		if (self.hayLadrillos(cosas)) {
			bultos += self.calcularBultosPorLadrillos(cosas)
		}
		if (self.hayBateriaAntiaerea(cosas)) {
			bultos += self.calcularBultosPorBateriaAntiaerea(cosas)
		}
		if (self.hayContenedorPortuario(cosas)) {
			bultos += 1 + self.calcularBultosPorContenedor(cosas)
		}
		return bultos
	}

	method hayLadrillos(cosas) = cosas.contains(paqueteDeLadrillos)

	method hayBateriaAntiaerea(cosas) = cosas.contains(bateriaAntiaerea)

	method hayContenedorPortuario(cosas) = cosas.contains(contenedorPortuario)

	method calcularBultosPorLadrillos(cosas) {
		const ladrillos = cosas.find{ cosa => cosa == paqueteDeLadrillos }
		return ladrillos.bultos()
	}

	method calcularBultosPorBateriaAntiaerea(cosas) {
		const bateria = cosas.find{ cosa => cosa == bateriaAntiaerea }
		if (bateria.tieneMisiles()) {
			return 2
		} else {
			return 1
		}
	}

	method calcularBultosPorContenedor(cosas) {
		const contenedor = cosas.find{ cosa => cosa == contenedorPortuario }
		return self.calcularBultos(contenedor.cosas())
	}

	method cantidadDeCosasQueEquivalenAUnBulto(cosas) = cosas.filter({ cosa => cosasQueSumanUnBulto.contains(cosa) }).size()

	method cantidadDeCosasQueEquivalenADosBultos(cosas) = cosas.filter({ cosa => cosasQueSumanDosBultos.contains(cosa) }).size()

}

