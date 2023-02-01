require 'CSV'

class Editorial
    attr_accessor :nombre, :cantidad
    def initialize(nombre,cantidad)
      @nombre=nombre
      @cantidad=cantidad
    end
end 

editoriales = []
CSV.foreach("librosLD.csv") do |fila| # Iterar línea o fila por fila
    boool = true
    editoriales.each do |element|
        if element.nombre==fila[1]
            element.cantidad +=1
            boool=false
        end
    end
    if boool 
        editoriales.push Editorial.new(fila[1],1)
    end 
end

editoriales.each do |element|
    CSV.open('editorial.csv','a') do |csv|
        csv<<[element.nombre , element.cantidad]
    end
end