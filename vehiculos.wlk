class Corsa {
  var color
  method capacidad() = 4
  method velocidadMax() = 150
  method peso() = 1300  
  method color() = color
  method cambiarColor(unColor) {
    color = unColor
  }
}
//var unCorsaVerde = new Corsa(color = "verde")
//var unCorsaAzul = new Corsa(color = "Azul")
class Kwid {
  var tieneTanquesAdicional
  method capacidad() = if(tieneTanquesAdicional) 3 else 4
  method velocidadMax() = if(tieneTanquesAdicional) 110 else 120
  method color() = "azul"
  method peso() = 1200 + if(tieneTanquesAdicional) 150 else 0
  method ponerTanqueAdicional(){tieneTanquesAdicional=true}
  method sacarTanqueAdicional(){tieneTanquesAdicional=false}
}

object trafic {
  var interior = comodo //objetos
  var motor = pulenta //objetos
  method cambiarInterior(unInterior) {
    interior = unInterior
  }
  method cambiarMotor(unMotor) {
    motor = unMotor
  }
  method capacidad() = interior.capacidad()
  method velocidadMax() = motor.velocidad()
  method color() = "blanco"
  method peso() = 4000 + interior.peso() + motor.peso()
}
object comodo {
  method capacidad() = 5
  method peso() = 700
}
object popular {
  method capacidad() = 12
  method peso() = 1000
}
object pulenta {
  method peso() = 800
  method velocidad() = 130
}
object bataton {
  method peso() = 500
  method velocidad() = 80
}

class AutosEspeciales {
  const property capacidad
  const property velocidadMax
  var color
  const property peso
  method capacidad() = capacidad
  method velocidadMax() = velocidadMax
  method color() = color
  method peso() = peso
  method cambiarColor(unColor) {
    color = unColor
  } 
}
//const especial1 = new AutosEspeciales(capacidad=2,velocidadMax=200,color = "gris",peso=1400)
