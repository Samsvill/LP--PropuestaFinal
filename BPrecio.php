<!DOCTYPE html>
<html>
  <head>
    <title>Magic Books</title>
    <link rel='stylesheet' href='public/stylesheets/style.css' type ="text/css"/>
    <link rel='stylesheet' href='public/stylesheets/base.css' type ="text/css"/>
    <link rel='stylesheet' href='public/stylesheets/ejercicio.css' type ="text/css"/>
    <link rel='stylesheet' href='public/stylesheets/table.css' type ="text/css"/>
    <link href="https://fonts.googleapis.com/css2?family=Dancing+Script&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Dancing+Script&family=Merriweather&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Charm&display=swap" rel="stylesheet">
  </head>
  <body>
    <div class="principal" >
        <div ALIGN=center>
            <a href="visualizacion1.php" class="itemPrincipal" ALIGN="center">Magic Books - Librería del Día</a>
            <nav class="grid" ALIGN=center >
                <a href="BAutor.php" class="items2">Autores</a>
                <a href="BEditorial.php" class="items2">Editoriales</a>
                <a href="BPrecio.php" class="items2">Precio</a>

            </nav>
        </div>
        <div class="cuerpo" ALIGN="center">
          <h2>Libros con mayor precio</h2>
          <?php
          echo "<table class=\"table table-striped table-hover\">
                  <thead>
                    <tr>
                      <th>Nombre Libro</th>
                      <th>Precio</th>
                    </tr>
                  </thead>
                </table>";
            if(file_exists("precios.csv")){
              $datosLectura = file("precios.csv");
              foreach($datosLectura as $line){
                $arreglo = explode(",", $line);
                $nombre = $arreglo[0];
                $precio=$arreglo[1].",".$arreglo[2];

              
             echo " <table class=\"table table-striped table-hover\">
                      <tbody>  
                        <tr>
                          <td>  $nombre</td>  
                          <td> € $precio</td>  
                        </tr>    
                      </tbody>  
                  </table>";
              }
            }
          ?>   
        </div>
          
    </div>

  </body>

</html>