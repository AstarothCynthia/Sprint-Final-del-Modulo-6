$productos = Array.new

File.open("catalogo_productos.txt", "w") do |file|
    file.write("")
end

def generarproducto(clave, nombre, unidad, precio, promocion, categoria, subcategoria)
    
    $productos.push ([clave, nombre, unidad, precio, promocion, categoria, subcategoria])

    nuevoProducto = clave.to_s+";"+nombre+";"+unidad+";"+precio.to_s+";"+promocion.to_s+";"+categoria+";"+subcategoria++"\n"

    File.open("catalogo_productos.txt", 'a') do |file|
        file.write nuevoProducto
    end


end

def generar_precio

    arregloprecio = []

    $productos.each do |e| 
        
        precio = e[4]
        arregloprecio.push(precio)

    end

    arregloprecio

end

def generar_precio_impuesto

    preciosFinales = []

    $productos.each do |e| 
        
        precioconiva = (e[4] * 1.19).round()
        preciosFinales.push(precioconiva)

    end

    preciosFinales

end

def buscar_producto(palabraclave)

    array = []

    $productos.each do |busqueda|

        busqueda.each do |e|

            if e.class == String

                palabra = (palabraclave.to_s).downcase

                if (e.downcase).include?(palabra)
                    
                    array.push(busqueda)
                
                end

            elsif e.class == Integer

                if e == palabraclave.to_i
                    
                    array.push(busqueda)
                    
                end

            end
        end
    end

    if array.empty?

        return "Articulo no encontrado"
        
    else      
        
        return array
        
    end

end

def mostrarPrecio(array)

    i = 1

    array.each do |e|

        puts "Precio N°" + i.to_s + ": $" + e.to_s

        i += 1

    end

end

def mostrarproducto(array)

    array.each do |e| 
        puts "Clave: " + e[0].to_s
        puts "Nombre: " + e[1]
        puts "Unidad: " + e[2]
        puts "Promoción: " + e[3].to_s + "%"
        puts "Precio: $" + e[4].to_s
        puts "Categoria: " + e[5]
        puts "SubCategoria: " + e[6]
        puts "\n"
    end

end

generarproducto(1, "Queso Mascarpone Fabiolio", "pza", 10, 25032, "Abarrotes", "Lacteos")
generarproducto(2, "Queso de cabrao", "pza", 10, 75032, "Abarrotes", "Lacteos")
generarproducto(3, "Cerveza Sasquatcho", "pza", 10, 45032, "Abarrotes", "Licores")
generarproducto(4, "Cerveza negra Steeleyeo", "pza", 15, 85032, "Abarrotes", "Licores")
generarproducto(5, "Escabeche de arenqueo", "pza", 20, 95032, "Abarrotes", "Pescaderia")
generarproducto(6, "Salmón ahumado Gravado", "pza", 20, 115032, "Abarrotes", "Pescaderia")
generarproducto(7, "Vino Côte de Blayeo", "pza", 15, 125032, "Abarrotes", "Licores")

puts "------------------------------------------------
| Bienvenidos al Identificador de precios 3b's |
------------------------------------------------"

pregunta = 1

while pregunta == 1
puts "\n"
puts "---Catálogo de productos---"



    #puts "\n"
    #puts "Qué acción quieres realizar: "
    puts "\n"
    puts "1. Generar un arreglo de un producto"
    puts "2. Generar un arreglo de precios"
    puts "3. Generar un arreglo de precios con impuestos"
    puts "4. Ordenar el arreglo Precios Finales en forma ascendente"
    puts "5. Buscar un producto en un arreglo"
    puts "6. Buscar un arreglo ordenado por rango"
    puts "7. Imprimir un arreglo ordenado en forma ascendente"
    puts "8. Imprimir catálogo completo"
    puts "9. Agregar un registro al arreglo"
    puts "\n"

    puts "¿Qué acción quieres realizar?: "
    opcion = gets.chomp.to_i
    puts "\n"

    case opcion
    when 1

        mostrarproducto($productos)

    when 2
        
        mostrarPrecio(generar_precio) 

    when 3

        mostrarPrecio(generar_precio_impuesto) 

    when 4
        
        mostrarPrecio(generar_precio_impuesto.sort()) 

    when 5
        
        puts "Ingrese producto a buscar"
        palabraclave = gets.chomp
        puts "\n"

        respuesta = buscar_producto(palabraclave)

        if respuesta == "Articulo no encontrado"
            puts respuesta
        else
            mostrarproducto(respuesta)
        end

    when 6
        
        puts "Ingrese un rango a considerar"
        puts "\n"
        i = 0

        puts "Ingrese valor mínimo"
        while i == 0
            minimo = gets.chomp.to_i

            if minimo < 0
                puts "Ingrese valor mínimo válido"
            else
                i = 1
            end
        end

        i = 0

        puts "\n"
        puts "Ingrese valor máximo"
        while i == 0
            maximo = gets.chomp.to_i
            if maximo <= minimo
                puts "Ingrese valor máximo válido"
            else
                i = 1
            end
        end

        a = []
        generar_precio.each do |e|
            if e >= minimo && e <= maximo
                a.push(e)
            end
        end

        arrayprecio = []

        a.each do |palabraclave|
            $productos.each do |e|

                if e[4] == palabraclave
                    arrayprecio.push(e)
                end
        
            end
        end
        puts "\n"
        mostrarproducto(arrayprecio)

    when 7

        array = generar_precio.sort()

        array.each do |palabraclave|
            
            mostrarproducto(buscar_producto(palabraclave))

        end

    when 8
        
        generarproducto(8, "Té Dharamsala", "pza", 10, 15032, "Abarrotes", "Cafeteria")
        generarproducto(9, "Cerveza tibetana Barley", "pza", 10, 5032, "Abarrotes", "Licores")
        generarproducto(10, "Sirope de regaliz", "pza", 15, 35000, "Abarrotes", "Cafeteria")
        generarproducto(11, "Especias Cajun del chef Anton", "pza", 25, 5000, "Abarrotes", "Aliños")
        generarproducto(12, "Mezcla Gumbo del chef Anton", "pza", 15, 8000, "Abarrotes", "Aliños")
        generarproducto(13, "Mermelada de grosellas de la abuela", "pza", 10, 10000, "Abarrotes", "Dulces")
        generarproducto(14, "Peras secas orgánicas del tío Bob", "pza", 10, 12000, "Abarrotes", "Conservas")
        generarproducto(15, "Salsa de arándanos Northwoods", "pza", 15, 8000, "Abarrotes", "Conservas")
        generarproducto(16, "Buey Mishi Kobe", "pza", 15, 7000, "Abarrotes", "Carnes")
        generarproducto(17, "Pez espada", "pza", 15, 6000, "Abarrotes", "Pescaderia")
        generarproducto(18, "Queso Cabrales", "pza", 10, 80000, "Abarrotes", "Lacteos")
        generarproducto(19, "Queso Manchego La Pastora", "pza", 25, 4000, "Abarrotes", "Lacteos")
        generarproducto(20, "Algas Konbu", "pza", 15, 18000, "Abarrotes", "Conservas")
        generarproducto(21, "Cuajada de judías", "pza", 10, 5500, "Abarrotes", "Conservas")

        mostrarproducto($productos)

    when 9

        puts "Ingresa la clave del producto"
        clave = gets.chomp.to_i

        puts "Ingresa nombre del producto"
        nombre = gets.chomp

        puts "Ingresa unidad del producto"
        unidad = gets.chomp

        puts "Ingresa Promocion del producto"
        promocion = gets.chomp.to_i

        puts "Ingresa Precio del producto"
        precio = gets.chomp.to_i

        puts "Ingresa Categoria del producto"
        categoria = gets.chomp

        puts "Ingresa subCategoria del producto"
        subcategoria = gets.chomp

        puts "\n"
        puts "La información del producto capturado es:"
        puts "Clave: " + clave.to_s
        puts "Nombre: " + nombre
        puts "Unidad: " + unidad
        puts "Promocion: " + promocion.to_s
        puts "Precio: $" + precio.to_s
        puts "Categoria: " + categoria
        puts "SubCategoria: " + subcategoria

        generarproducto(clave, nombre, unidad, promocion, precio, categoria, subcategoria)

    else
        puts "Opción ingresada no válida"
    end

    
    puts "\n"+"¿Quiere volver a realizar alguna opción?"
    puts "\n"
    puts "1) Si"
    puts "2) No"
    puts "\n"
    pregunta = gets.chomp.to_i
    
end