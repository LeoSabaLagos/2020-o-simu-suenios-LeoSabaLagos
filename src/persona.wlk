import suenio.*
import carrera.*

class Persona {
	
	var sueniosPendientes = []
	var sueniosCumplidos = []
	var edad
	var carrerasAEstudiar
	var carrerasRecibidas = []
	var cantidadHijos
	var felicidonios = 0
	var sueldo
	
	method sueldo() = sueldo
	method nivelFelicidad() = felicidonios
	method sueniosCumplidos() = sueniosCumplidos
	method carrerasRecibidas() = carrerasRecibidas
	
	method aumentarFelicidonios(cantidadFelicidonios){ felicidonios = felicidonios + cantidadFelicidonios }
	
	method cantidadHijos() = cantidadHijos
	method noTieneHijos() = self.cantidadHijos() == 0
	
	method quiereEstudiarTalCarrera(unaCarrera) = carrerasAEstudiar.contains(unaCarrera)
	
	method noSeRecibioDe(unaCarrera) = not(carrerasRecibidas.contains(unaCarrera))
	
	method recibirseDe(unaCarrera){
		carrerasAEstudiar.remove(unaCarrera)
		carrerasRecibidas.add(unaCarrera)
	}
	
	method completarSuenio(unSuenio){
		sueniosPendientes.remove(unSuenio)
		sueniosCumplidos.add(unSuenio)
	}
	
	method intentaCumplir(unSuenio){
		if(unSuenio.criterioSuenio(self))
			unSuenio.cumplirSuenio(self)
		else
			self.error("No se puede cumplir el suenio")
	}
}
