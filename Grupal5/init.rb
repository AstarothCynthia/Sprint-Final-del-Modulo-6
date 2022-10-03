$productos = Hash.new("Dato no existente")

File.open("catalogo _ producto _ hash.txt", "w") do |file|
    file.write("")
end

def crear_porducto(clave, nombre, unidad, precio, categoria)

    codigo = generador_codigo(clave, categoria)

    $productos[codigo] = {"clave" => clave, "nombre" => nombre, "unidad" => unidad, "precio" => precio, "categoria" => categoria}  

    nuevoProducto = clave.to_s+";"+nombre+";"+unidad+";"+precio.to_s+";"+categoria+"\n"

    File.open("catalogo _ producto _ hash.txt", 'a') do |file|
        file.write nuevoProducto
    end

end

def generador_codigo(clave, categoria)
    codigo = clave.to_s + categoria.slice(0,3)+"3BS"
    codigo = codigo.upcase
    codigo
end

def buscar_producto(codigo)

    if $productos[codigo] == "Dato no existente"
        puts $productos[codigo]
    else

        puts "Código: " + codigo
        puts "Clave: " + $productos[codigo].values[0].to_s
        puts "Nombre: " + $productos[codigo].values[1]
        puts "Unidad: " + $productos[codigo].values[2]
        puts "Precio: $" + $productos[codigo].values[3].to_s
        puts "Categoría: " + $productos[codigo].values[4]

    end
end

crear_porducto(001, "Queso Mascarpone Fabiolio", "pza" , 25032, "Abarrotes")
crear_porducto(002, "Queso de cabrao", "pza", 75032, "Abarrotes")
crear_porducto(003, "Cerveza Sasquatcho", "pza", 45032, "Abarrotes")
crear_porducto(004, "Cerveza negra Steeleyeo", "pza", 85032, "Abarrotes")
crear_porducto(005, "Escabeche de arenqueo", "pza", 95032, "Abarrotes")
crear_porducto(006, "Salmón ahumado Gravado", "pza", 115032, "Abarrotes")
crear_porducto(007, "Vino Côte de Blayeo", "pza", 125032, "Abarrotes")


puts "----------------------------------------------
| Bienvenido al Identificador de precios 3b's |
----------------------------------------------"
puts "\n"
puts "---Catálogo de productos---"

pregunta = 1

while pregunta == 1

    puts "\n"
    puts "Qué acción quieres realizar: "
    puts "\n"
    puts "1. Mostrar productos"
    puts "2. Buscar producto"
    puts "3. Imprimir datos del texto"
    puts "\n"

    puts "¿Qué acción quieres realizar?: "
    opcion = gets.chomp.to_i
    puts "\n"

    case opcion
    when 1

        $productos.each do |llave, valor|

            puts "Código: #{llave}"
            puts "Clave: #{valor["clave"]}"
            puts "Nombre: #{valor["nombre"]}"
            puts "Unidad: #{valor["unidad"]}"
            puts "Precio: $#{valor["precio"]}"
            puts "Categoría: #{valor["categoria"]}"
            puts "\n"

        end            
        
    when 2

        puts "Ingrese código del producto"
        codigoingresado = gets.chomp
        puts "\n"

        puts buscar_producto(codigoingresado.upcase)
        puts "\n"

    when 3

        content = File.read("catalogo _ producto _ hash.txt") # lee el archivo
        lines = content.split("\n") # divide el contenido en líneas
        
        arreglo = []
        # recorre las líneas y las imprime
        lines.each do |line|
            arreglo = line.split(";")
            hash = {"clave" => generador_codigo(arreglo[0], arreglo[4]), "nombre" => arreglo[1], "precio" => arreglo[3], "categoria" => arreglo[4]}
            puts hash
            puts "\n"
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
