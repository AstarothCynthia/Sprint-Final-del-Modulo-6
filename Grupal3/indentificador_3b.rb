$precio_total = 0

puts "    ------------------------------------------------------
       | Bienvenido al Identificador de precios 3b's |
    ------------------------------------------------------"
puts "\n"+"-----Catálogo de productos-----"
puts "\n"

def calculadora_productos(codigo, nombre, unidad, precio, promocion, categoria, subcategoria)
    
    puts "Los datos del producto son:"
    puts "Clave: " + generador(codigo, categoria)
    puts "Nombre: " + nombre
    puts "Categoría: " + categoria
    puts "Precio neto: $" + precio.to_s
    puts "Precio final: $" + redondear(precio).to_s

end

def generador(codigo, categoria)
    clave = codigo.to_s + categoria.slice(0,3)+"3BS"
    clave = clave.upcase
    clave
end


def redondear(precio)
    precio_final = precio * 1.19
    precio_final = precio_final.round
    sumar(precio_final)
    precio_final
end

def sumar(precio_final)
    $precio_total = $precio_total + precio_final
end

puts calculadora_productos(001,"Lapiz grafito", "pieza", 150, 10, "Librería", "Escolares")
puts calculadora_productos(002,"Lapices de colores", "caja", 2000, 15, "Librería", "Escolares")
puts calculadora_productos(003,"Goma", "pieza", 50, 10, "Librería", "Escolares")

puts "Precio total: $" + $precio_total.to_s