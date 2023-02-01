require 'open-uri'
require 'nokogiri'
require 'csv'



class Libro
  attr_accessor :nombre, :editorial, :autor, :precio,:portada
  def initialize(nombre,editorial,autor,precio,portada)
    @nombre=nombre
    @editorial=editorial
    @autor=autor
    @precio=precio
    @portada=portada

  end
  def guardar()
    CSV.open('librosLD.csv','a') do |csv|
    csv<<[@nombre,@editorial,@autor,@precio,@portada]
    end
  end
end   


libreriaDay = 'https://www.libreriaday.es/es/busqueda/listaLibrosLote.php?pagSel=1&orden=prioridad%2C+fecha_alta+desc&cuantos=50&codigo=G55105'
datosLibreriaDay = URI.open(libreriaDay)
datosLDParseado = Nokogiri::HTML(datosLibreriaDay.read)
lista_libros = datosLDParseado.css('.listado_libros')

lista_libros.css('li').each do |libro|
  titulo = libro.css('.dublincore').css('.title').css('a').inner_text.strip
  precio = libro.css('.botones').css('.precio').css("strong").inner_text.strip
  info = libro.css('.dublincore').css('dd').inner_text
  info = info.split("\n")
  editorial =info[7].strip
  autor = info[0]
  autor= autor.sub titulo , ""
  autor=autor.strip
  portada = libro.css('.portada').css('a').css('img').attr('src')
  libro1=Libro.new(titulo,editorial,autor,precio,portada)
  libro1.guardar

end
