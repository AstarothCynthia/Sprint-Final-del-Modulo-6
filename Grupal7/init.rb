require_relative 'class/producto'
require_relative 'class/marca'
require_relative 'class/categoria'

def buscar_datos(id, tipo, texto)
    
    dato = ""

    if tipo == "producto"
        dato = Producto.new
    elsif tipo == "marca"
        dato = Marca.new
    elsif tipo == "categoria"
        dato = Categoria.new
    end

    if texto == "mostrarId"
        datos = dato.mostrar_id(id)
    elsif texto == "mostrarNombre"
        datos = dato.mostrar_nombre(id, tipo)
    elsif texto == "especial"
        dato = Producto.new
        datos = dato.mostrar_nombre(id, tipo)
    end

end

puts"------------------------------------------------
| Bienvenidos al Identificador de precios 3b's |
------------------------------------------------
"
puts "\n"

puts "---Catálogo de productos---"
puts "\n"

pregunta = 1

while pregunta == 1

    puts "Que acción quieres realizar"
    puts "\n"
    puts "1. Alta de Marca"
    puts "2. Alta de Categoría"
    puts "3. Alta de Producto"
    puts "4. Buscar Producto por Clave"
    puts "\n"

    opcion = gets.chomp.to_i
    puts "\n"

    case opcion
    when 1

        respuesta = 0

        while respuesta == 0

            puts "Ingresa la id de la marca"
            id = gets.chomp.to_i
            puts "\n"

            dato = buscar_datos(id, "marca", "especial")

            if dato.class == Array

                respuesta = 1

            else
                puts "Id ya existente"
                puts "\n"            
            end


        end

        respuesta = 0

        while respuesta == 0

            puts "Ingresa nombre de la marca"
            nombre = gets.chomp
            puts "\n"

            if nombre != ""
                respuesta = 1
            else
                puts "Ingrese nombre válido"
                puts "\n" 
            end

        end

        nuevaMarca = Marca.new
        nuevaMarca.alta_marca(id, nombre)

    when 2

        respuesta = 0

        while respuesta == 0

            puts "Ingresa la id de la categoria"
            id = gets.chomp.to_i
            puts "\n"

            dato = buscar_datos(id, "categoria", "especial")

            if dato.class == Array

                respuesta = 1

            else
                puts "Id ya existente"
                puts "\n"            
            end


        end

        respuesta = 0

        while respuesta == 0

            puts "Ingresa nombre de la categoria"
            nombre = gets.chomp
            puts "\n"

            if nombre != ""
                respuesta = 1
            else
                puts "Ingrese nombre válido"
                puts "\n" 
            end

        end

        nuevaCategoria = Categoria.new
        nuevaCategoria.alta_categoria(id, nombre)

    when 3

        nombre = ""
        respuesta = 0

        while respuesta == 0

            puts "Ingresa la id del producto"
            id = gets.chomp.to_i
            puts "\n"

            dato = buscar_datos(id, "producto", "mostrarNombre")

            if dato.class != Array

                puts "El producto a agregar es: " + dato.to_s
                puts "\n"
                nombre = dato.to_s

            end

            respuesta = 1

        end

        if nombre == ""
            respuesta = 0
        end

        while respuesta == 0

            puts "Ingresa nombre del producto"
            nombre = gets.chomp
            puts "\n"

            if nombre != ""
                respuesta = 1
            else
                puts "Ingrese nombre válido"
                puts "\n" 
            end

        end

        respuesta = 0

        while respuesta == 0

            puts "Ingresa unidad del producto"
            unidad = gets.chomp
            puts "\n"

            if unidad != ""
                respuesta = 1
            else
                puts "Ingrese unidad válida"
                puts "\n" 
            end

        end

        respuesta = 0

        while respuesta == 0

            puts "Ingresa Precio del producto"
            precio = gets.chomp.to_i
            puts "\n"

            if precio.to_i > 0
                respuesta = 1
            else
                puts "Ingrese precio válido"
                puts "\n" 
            end

        end

        respuesta = 0

        while respuesta == 0

            puts "Ingresa Marca del producto"
            marca = gets.chomp
            puts "\n"

            dato = buscar_datos(marca, "marca", "mostrarId")

            if dato.class != Array

                marca = dato
                respuesta = 1

            else
                puts "Marca no registrada"
                puts "\n"            
            end

        end

        respuesta = 0

        while respuesta == 0

            puts "Ingresa Categoria del producto"
            categoria = gets.chomp
            puts "\n"

            dato = buscar_datos(categoria, "categoria", "mostrarId")

            if dato.class != Array

                categoria = dato
                respuesta = 1

            else
                puts "Categoria no registrada"
                puts "\n"            
            end

        end

        nuevoProducto = Producto.new
        nuevoProducto.alta_producto(id, nombre, unidad, precio, marca, categoria)


    when 4

        puts "Ingrese producto a buscar"
        palabraclave = gets.chomp
        puts "\n"

        buscarProducto = Producto.new
        impresion = buscarProducto.buscar_producto(palabraclave)

        if impresion == 0
            
            puts "Artículo no encontrado"
        
        end

    else
        puts "Opción no válida"
    end


    puts "\n"+"¿Quiere volver a realizar alguna opción?"
    puts "\n"
    puts "1) Si"
    puts "2) No"
    puts "\n"
    pregunta = gets.chomp.to_i
end