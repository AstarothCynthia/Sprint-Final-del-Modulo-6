require_relative 'modulo'

class Producto
    include Mod

    attr_accessor :id, :nombre

    def generar_clave(id, categoria)

        codigo = id.to_s + categoria.slice(0,3)+"3BS"
        codigo = codigo.upcase

    end
    
    def calcular_precio_final(precio)

        precioconiva = (precio.to_i * 1.19).round()

    end

    def buscar_producto(clave)

        content = File.read("db/inventario_final.txt") # lee el archivo
        lines = content.split("\n") # divide el contenido en líneas

        impresion = 0

        lines.each do |line|

            array = line.split(",")

            if array[0].to_i == clave.to_i
                
                puts "Clave: " + array[0].to_s
                puts "Nombre: " + array[1]
                puts "Unidad: " + array[2]
                puts "Precio: $" + array[3].to_s
                puts "Precio final: $" + self.calcular_precio_final(array[3]).to_s
                puts "Marca: " + self.mostrar_nombre(array[4], "marca")
                puts "Categoria: " + self.mostrar_nombre(array[5], "categoria")
                puts "\n"

                impresion += 1

            end

        end
        
        return impresion

    end

    def alta_producto(id, nombre, unidad, precio, marca, categoria)

        consultaId = self.mostrar_nombre(id, "producto")

        if nombre.class != consultaId.class

            crearProducto = id.to_s+","+nombre.to_s+"\n"
            
            File.open("db/catalogo_producto.txt", 'a') do |file|
                file.write crearProducto
            end
            
        end

        clave = self.generar_clave(id, categoria)

        nuevoProducto = clave.to_s+","+nombre.to_s+","+unidad.to_s+","+precio.to_s+","+marca.to_s+","+categoria.to_s+"\n"

        File.open("db/inventario_final.txt", 'a') do |file|
            file.write nuevoProducto
        end

        puts "Producto agregado correctamente"

    end

end