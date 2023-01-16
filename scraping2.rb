require 'open-uri'
require 'nokogiri'
require 'csv'

nextory = 'https://www.nextory.es/libros-populares-de-la-semana/'
datosnextory = URI.open(nextory)

datosnextoryParseado = Nokogiri::HTML(datosnextory.read)
lista_items = datosnextoryParseado.css('.Bookgroupnew_bookGroupNew__3roBB')
docu = CSV.open('libros2.csv','a')

lista_items.css('.Bookgroupnew_bookGroupNew__item__30tFg').each do |itemObra|
    titulo = itemObra.css('.Bookcard_bookCard__title__3wm6B').css('.Bookcard_bookCard__titleText__PvQlR').inner_text
    puts titulo
    docu<<[titulo]
    
end