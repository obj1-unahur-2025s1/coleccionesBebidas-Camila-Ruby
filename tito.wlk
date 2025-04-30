object tito {
  var cantidad = 0
  var bebida = cianuro
  
  method peso() = 70
  
  method inerciaBase() = 490
  
  method consumir(unaCantidad, unaBebida) {
    bebida = unaBebida
    cantidad = unaCantidad
  }
  
  method bebida() = bebida
  
  method velocidad() = (bebida.rendimiento(
    cantidad
  ) * self.inerciaBase()) / self.peso()
}

object whisky {
  method rendimiento(cantidad) = 0.9 ** cantidad
}

object cianuro {
  method rendimiento(cantidad) = 0
}

object terere {
  method rendimiento(cantidad) = 1.max(cantidad * 0.1)
}

object licuado {
  const nutrientes = []
  
  method nutrientes() = nutrientes

  method nutrientesTotales() = nutrientes.sum()

  method rendimiento(cantidad) = nutrientes.sum() * cantidad
  
  method agregar(nutriente) {
    nutrientes.add(nutriente)
  }
}

object aguaSaborizada {
  var property bebida = terere
  
  method rendimiento(cantidad) = 1 + (bebida.rendimiento(cantidad) / 4)
}

object coctelDeBebidas {
  const property bebidas = []
  
  method rendimiento(cantidad) {
    if (bebidas.contains(cianuro)) {
      return 0
    } else {
      return bebidas.sum({ b => b.rendimiento(cantidad) }) * bebidas.size()
    }
  }
  
  method agregarBebida(unaBebida) {
    bebidas.add(unaBebida)
  }
}