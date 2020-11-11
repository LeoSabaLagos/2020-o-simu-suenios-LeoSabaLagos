import persona.*
import lugarViaje.*

class Suenio {
	var felicidoniosPorCumplirlo
	
	method felicidoniosPorCumplirlo() = felicidoniosPorCumplirlo
	
	method otorgarFelicidonios(unaPersona) { unaPersona.aumentarFelicidonios(self.felicidoniosPorCumplirlo()) }
	
	method cumplirSuenio(unaPersona){
		self.otorgarFelicidonios(unaPersona)
		unaPersona.completarSuenio(self)
	}
	
	method criterioSuenio(unaPersona) = self.noFallaValidaciones(unaPersona)
	
	method noFallaValidaciones(unaPersona) = true
	
	method esAmbicioso() = self.felicidoniosPorCumplirlo() > 100
}

class ViajarA inherits Suenio {
	var lugar
}


class RecibirseDe inherits Suenio {
	var carrera
	
	override method noFallaValidaciones(unaPersona) = 
		unaPersona.noSeRecibioDe(carrera) && unaPersona.quiereEstudiarTalCarrera(carrera)
		
	override method cumplirSuenio(unaPersona){
		
		unaPersona.recibirseDe(carrera)
		
		super(unaPersona)
	}
	
}

class LaburoSoniado inherits Suenio {
	var sueldoSoniado
	
	override method noFallaValidaciones(unaPersona) = sueldoSoniado > unaPersona.sueldo()
}


class SuenioHijos inherits Suenio{
	
	override method cumplirSuenio(unaPersona){
		
		self.asignarHijos(unaPersona)
		
		super(unaPersona)
	}
	
	method asignarHijos(unaPersona) { unaPersona.recibirNuevoHijo()}
}

class TenerUnHijo inherits SuenioHijos {
	// no tiene validaciones para cumplirse
}

class AdoptarHijos inherits SuenioHijos {
	
	var cantidadHijos
	
	override method noFallaValidaciones(unaPersona) = unaPersona.noTieneHijos()
	
	override method asignarHijos(unaPersona) { 
		cantidadHijos.times{unaPersona.recibirNuevoHijo()}	
	}
}

class SuenioMultiple inherits Suenio {
	
	var suenios = [
		new ViajarA(lugar = cataratas, felicidoniosPorCumplirlo = 250),
		new TenerUnHijo(felicidoniosPorCumplirlo = 150),
		new LaburoSoniado(sueldoSoniado = 5, felicidoniosPorCumplirlo = 100) ]
		
	override method noFallaValidaciones(unaPersona) = 
		suenios.all({suenio => suenio.noFallaValidaciones(unaPersona)})
		
	override method cumplirSuenio(unaPersona){
		
		felicidoniosPorCumplirlo = self.totalFelicidoniosPorCumplirlo()
		
		super(unaPersona)
	}
	
	method totalFelicidoniosPorCumplirlo() = suenios.map({suenio => suenio.felicidoniosPorCumplirlo()}).sum()
}



