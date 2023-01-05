require 'open-uri'
require 'nokogiri'
require 'csv'

cervantes = 'https://www.cervantesvirtual.com/buscador/?tipo=palabras_todas&busqueda=combinada&ftipo=texto&q=juvenil&orden=PONDERACION&limit=50&vista=expandida'
datosCervantes = URI.open(cervantes)
cervantesParseado = Nokogiri::HTML(datosCervantes.read)
lista_items = cervantesParseado.css('.contenido').css('.col-lg-9').css('.item-obra')

lista_items.css('.datos-item-obra').each do |itemObra|
    strip = itemObra.css('.titulo').inner_text.split("-")
    puts strip[0]
end
