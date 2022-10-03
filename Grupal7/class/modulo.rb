module Mod

    def mostrar_nombre(id, tipo)

        archivo = ""

        if tipo == "producto"
            archivo = "db/catalogo_producto.txt"
        elsif tipo == "marca"
            archivo = "db/catalogo_marca.txt"
        elsif tipo == "categoria"
            archivo = "db/catalogo_categorias.txt"
        end
        
        content = File.read(archivo) # lee el archivo
        lines = content.split("\n") # divide el contenido en líneas

        array = []

        lines.each do |line|

            array = line.split(",")

            if array[0].to_i == id.to_i
                return array[1]
            end

        end

    end

end