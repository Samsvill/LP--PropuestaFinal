require 'CSV'

class Precio
    attr_accessor :libro, :precio
    def initialize(libro,precio)
      @libro=libro
      @precio=precio
    end
end 

precios = []
CSV.foreach("librosLD.csv") do |fila| # Iterar línea o fila por fila
    precio=fila[3].sub '€' , ""
    libro=Precio.new(fila[0],precio)
    libro_buscar = precios.detect { |n| n.precio.to_i<precio.to_i }
        if !libro_buscar.nil?
            indice = precios.index(libro_buscar)
            array1 = precios.slice(0,indice)
            array2 = precios.slice(indice,precios.length-indice)
            precios=array1 
            precios.push libro
            precios= precios.concat(array2)
        else  
        precios.push libro
        end 
end

precios.each do |element|
    CSV.open('precios.csv','a') do |csv|
        csv<<[element.libro , element.precio]
    end
end