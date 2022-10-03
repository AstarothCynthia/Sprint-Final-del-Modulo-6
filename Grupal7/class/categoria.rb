class Categoria

    attr_accessor :id, :nombre

    def alta_categoria(id, nombre)

        crearCategoria = id.to_s+","+nombre.to_s+"\n"
        
        File.open("db/catalogo_categorias.txt", 'a') do |file|
            file.write crearCategoria
        end

        puts "Datos guardados correctamente"

    end

    def mostrar_id(palabraclave)

        content = File.read("db/catalogo_categorias.txt") # lee el archivo
        lines = content.split("\n") # divide el contenido en líneas
        palabra = (palabraclave.to_s).downcase

        array = []

        lines.each do |line|

            array = line.split(",")

            if array[1].to_s.downcase == palabra
                return array[0]
            end

        end

    end

end