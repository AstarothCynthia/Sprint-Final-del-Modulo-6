require 'net/http'
require 'json'
require 'uri'

uri = URI('https://mindicador.cl/api')#ENDPOINT
res = Net::HTTP.get_response(uri)
$resultado = JSON.parse(res.body) if res.is_a?(Net::HTTPSuccess)

def consultor_divisas(nombre, descripcion)
    
    consultor = $resultado[nombre][descripcion]
    
end

puts"------------------------------------------------
| Bienvenidos al Identificador de precios 3b's |
------------------------------------------------
"
puts "\n"

pp "El valor del "+ consultor_divisas("dolar", "nombre") + " el dia de hoy es: $ " + (consultor_divisas("dolar", "valor").round).to_s
pp "El valor del "+ consultor_divisas("dolar_intercambio", "nombre") + " el dia de hoy es: $ " + (consultor_divisas("dolar_intercambio", "valor").round).to_s
pp "El valor del "+ consultor_divisas("euro", "nombre") + " el dia de hoy es: $ " + (consultor_divisas("euro", "valor").round).to_s
pp "El valor del "+ consultor_divisas("bitcoin", "nombre") + " el dia de hoy es: $ " + (consultor_divisas("bitcoin", "valor").round).to_s