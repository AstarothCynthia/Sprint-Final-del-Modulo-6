puts "----------------------------------------------
| Bienvenido al Identificador de precios 3b's |
----------------------------------------------"

puts "----Ingresa la siguente información del producto----"

puts "Ingresa la clave"
clave = gets.chomp

puts "Ingresa nombre"
nombre = gets.chomp

puts "Ingresa Marca"
marca = gets.chomp

puts "Ingresa Unidad"
unidad = gets.chomp

puts "Ingresa Precio"
precio = gets.chomp

numero = precio.to_i

if numero < 1000
    precioFinal = precio+" USD"
else
    precioFinal = precio+" CLP"
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

nuevoProducto = clave+";"+nombre+";"+marca+";"+unidad+";"+precio+";"+categoria+"\n"

File.open("productos.txt", 'a') do |file|
    file.write nuevoProducto
end

