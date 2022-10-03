puts "----------------------------------------------
| Bienvenido al Identificador de precios 3b's |
----------------------------------------------"

puts "----Ingresa la siguente información del producto----"

puts "¿Cuántos productos deseas dar de alta?"
valor = gets.chomp.to_i

i = 1
precioUSD = 0
precioCLP = 0

array = []

valor.times do

    puts "\n"

    puts "Ingresa la clave del producto "+i.to_s
    clave = gets.chomp

    puts "Ingresa nombre del producto "+i.to_s
    nombre = gets.chomp

    puts "Ingresa Marca del producto "+i.to_s
    marca = gets.chomp

    puts "Ingresa Unidad del producto "+i.to_s
    unidad = gets.chomp

    puts "Ingresa Precio del producto "+i.to_s
    precio = gets.chomp

    numero = precio.to_i

    if numero < 1000
        precioFinal = precio+" USD"
        precioUSD = precioUSD + precio.to_i
    else
        precioFinal = precio+" CLP"
        precioCLP = precioCLP + precio.to_i
    end

    puts "Ingresa Categoria"
    categoria = gets.chomp

    puts "\n"
    puts "La información del producto capturado es:"
    puts "Clave: "+clave
    puts "Nombre: "+nombre
    puts "Marca: "+marca
    puts "Unidad: "+unidad
    puts "Precio: $"+precioFinal
    puts "Categoria: "+categoria

    array.push(clave,nombre,marca,unidad,precio,categoria)

    nuevoProducto = clave+";"+nombre+";"+marca+";"+unidad+";"+precio+";"+categoria+"\n"

    File.open("productos.txt", 'a') do |file|
        file.write nuevoProducto
    end

    valor = valor - 1
    i = i + 1
end

puts "\n"
puts "---Las sumas totales son:---"
puts "La Suma de los precios capturados en USD es: "+precioUSD.to_s
puts "La Suma de los precios capturados en CLP es: "+precioCLP.to_s