object neo{
  var energia = 100 // comienza con 100

  method esElElegido() = true
  method vitalidad() = energia * 0.1 
  method saltar() {
    energia = energia - (energia / 2)
  //energia -= energia * 0.5  OTRA FORMA DE HACERLO
  }
}

object morfeo {
  var vitalidad = 8
  var estaDescansado = true
  method esElElegido() = false 
  method vitalidad() = vitalidad
  
  method saltar() {//cambio de estado de cansado a no descansado o alrevez apartir de la accion salto.
    estaDescansado = not estaDescansado
  // no queremos que tenga vitalidad con num negativo
  vitalidad = (vitalidad - 1).max(0)
  //ej vitalidad = 3.max(0) -> 3
  //ej vitalidad = (-1).max(0) -> 0
  }
}
object trinity {
  method vitalidad() = 0 
  method saltar() { 
  
  }
    //lo necesito x polimorfico. se deja vacio ya que no hace nada
}
object nave {
  const pasajeros = #{neo, morfeo, trinity}

  method cuantosPasajerosHay() = pasajeros.size()

  //pasajero de mayor vitalidad
  method pasajerosDeMayorVitalidad() = pasajeros.max({p=>p.vitalidad()})
  //un extra para que veamos como se hace con minimo
  method pasajerosDeMinimoVitalidad() = pasajeros.min({p=>p.vitalidad()})

  method estaEquilibrado() {
    return
      (self.pasajerosDeMayorVitalidad().vitalidad() < self.pasajerosDeMinimoVitalidad())
  }

  method estaElElegido() = pasajeros.any({p=>p.esElElegido()})

  method choca() {
    pasajeros.forEach({p=>p.saltar()}) // va realizar un accion
    pasajeros.clear() // ya que salen todos de la nave 
  }
  method acelerar() {
    pasajeros.filter({ p=> not p.esElElegido()}).forEach({p => p.saltar()})
    pasajeros.remove(neo)
  }
}