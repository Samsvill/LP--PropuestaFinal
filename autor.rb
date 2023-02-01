require 'CSV'

class Autor
    attr_accessor :nombre, :cantidad, :libro
    def initialize(nombre,cantidad,libro)
      @nombre=nombre
      @cantidad=cantidad
      @libro=libro
    end
end 

autores = []
CSV.foreach("librosLD.csv") do |fila| # Iterar línea o fila por fila
    boool = true
    autores.each do |element|
        if element.nombre==fila[2]
            element.cantidad +=1
            element.libro+=   "|" + fila[0]
            boool=false
        end
    end
    if boool 
        autores.push Autor.new(fila[2],1,fila[0])
    end 
end

autores.each do |element|
    CSV.open('autores.csv','a') do |csv|
        csv<<[element.nombre , element.cantidad,element.libro]
    end
end