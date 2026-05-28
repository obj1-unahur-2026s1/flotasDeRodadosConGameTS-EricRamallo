class Dependencia {
  const property flota = []
  const empleados
  //metodos para los pedidos etapa 3
  const property pedidos = []
  method agregar(unPedido) {
    pedidos.add(unPedido)
  }
  method quitar(unPedido) {
    pedidos.remove(unPedido)
  }
  method cantidadTotalDePasajerosDeTodosLosPedidos() = pedidos.sum({p => p.cantidadDePasajeros()})
  method losPedidosQueNoPuedenSerSatisfechos() = pedidos.filter({p => self.hayAlgunAutoNoPuedeSatisfacer(p)})
  method hayAlgunAutoNoPuedeSatisfacer(unPedido) = flota.any({a=> !unPedido.puedeSatisfacerElPedido(a)})
  method todosLosPedidoTieneIncompatible(unColor) = pedidos.all({p=> p.coloresIncompatibles().contains(unColor)})//ver esto
  method relajarTodoLosPedidos() {
    pedidos.forEach({p => p.relajar()})
  }
  //metodos de la flota de rodados con los que cuenta
  method agregarAFlota(unRodado) {
    flota.add(unRodado)
  }
  method quitarAFlota(unRodado) {
    flota.remove(unRodado)
  }
  method pesoTotalFlota() = flota.sum({a=>a.peso()})
  method estaBienEquipada() = flota.size()>3 && self.todosPuedenIrAlMenosACien(100)
  method todosPuedenIrAlMenosACien(unaVelocidad)= flota.all({r => r.velocidadMax() >= unaVelocidad})
  method capacidadTotalEnColor(color) = self.todosLosRodadosDeColor(color).sum({r => r.capacidad()})
  method todosLosRodadosDeColor(unColor) = flota.filter({r => r.color() == unColor})
  method colorDelRodadoMasRapido() = self.elRodadoMasRapido().color()
  method elRodadoMasRapido() = flota.max({r => r.velocidadMax()})
  method capacidadFaltante() = empleados - self.capacidadTotalFlota().max(0)
  method capacidadTotalFlota() = flota.sum({r=>r.capacidad()})
  method esGrande() = empleados >= 40 && flota.size() == 5//>
}
class Pedidos {
  const distancia
  var tiempoMax
  var cantPasajeros
  const property coloresIncompatibles = #{}

  method cantidadDePasajeros() = cantPasajeros
  method tiempoEstimado() = tiempoMax
  method velocidadDelPedido() = distancia.div(tiempoMax)
  method puedeSatisfacerElPedido(unAuto) = unAuto.velocidadMax() >= self.velocidadDelPedido()+10 && unAuto.capacidad() >= cantPasajeros && not coloresIncompatibles.contains(unAuto.color())

  method agregarColorIncopatible(unColor) {
    coloresIncompatibles.add(unColor)
  }
  method cambiarLaCantidadDePasajeros(unValor) {
    cantPasajeros = unValor
  }
  method cambiarTiempoMaximo(unValor) {
    tiempoMax = unValor
  }
  method acelerar() {
    tiempoMax = tiempoMax-1.max(0)
  }
  method relajar() {
    tiempoMax = tiempoMax + 1
  }
}