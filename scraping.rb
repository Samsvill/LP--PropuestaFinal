require 'open-uri'
require 'nokogiri'
require 'csv'

link = 'https://nostarch.com/catalog.htm'
datosHTML = URI.open(link)
datosParseados = Nokogiri::HTML(datosHTML.read)
bookList = datosParseados.css('.view-content')

class Book
  attr_accessor :title, :subt, :author, :price
   def initialize(titulo, subt, autor, pr)
     @title = titulo.to_s
     @subt = subt.to_s
     @author = autor.to_s
     @price = pr.to_s
   end

  def guardar()
    CSV.open('ejemplo.csv','a') do |csv|
      csv<< [@title+"/"+@subt+"/"+@author+"/"+@price]
    end
  end
end

bookList.css(".product-info-wrapper").each do |post|
  title = post.css(".product-title").inner_text
  subt = post.css(".product-subtitle").inner_text
  author = post.css(".product-author").inner_text
  price = post.css(".uc-price").inner_text
  
  book = Book.new(title,subt,author,price)
  book.guardar
  
end
