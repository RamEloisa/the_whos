# The Whos

# Api Key IMDB
Para poder realisar llamadas se requiere ingresar la clave de la api de IMDB, para octener una clave gratuita tiene que regístrese en el sitio de la API, https://imdb-api.com/Identity/Account/Register, las cuentas gratuitas tienen un límite de 100 consultas por día.
Pará poder utilizar la clave se tiene que pasar el valor en la línea de comandos antes de ejecutar el scrip. 

# Class Title 
Este clase se encarga de almacenar la información de la llamada de los títulos. 
Pará instanciala se puede hacer a través de Title.new o The Whos.create pasando como parámetro el ID de el título. 
# Método id
Devuelve el ID del título. 
# Método title
Devuelve el título. 
# Método cast
Devuelve los 10 actores principales 
# Método fullcast
Devuelve el reparto completo del título.
# Método pout
Devuelve la sinopsis del título, se puede pasar como valor el idioma en el que se desee la respuesta, el valor por defecto es en inglés. 

# Class Actor
