# The Whos

## Api Key IMDB
Para poder realisar llamadas se requiere ingresar la clave de la api de IMDB, para octener una clave gratuita tiene que regístrese en el sitio de la API, https://imdb-api.com/Identity/Account/Register, las cuentas gratuitas tienen un límite de 100 consultas por día.
Pará poder utilizar la clave se tiene que pasar el valor en la línea de comandos antes de ejecutar el scrip. 

## Class Title 
Esta clase se encarga de almacenar la información de la llamada de los títulos. 
Pará instanciar el objeto se puede hacer a través de Title.new o TheWhos.create pasando como parámetro el ID de el título de IMDB. 
### Método id
Devuelve el ID del título. 
### Método title
Devuelve el título. 
### Método cast
Devuelve los 10 actores principales 
### Método fullcast
Devuelve el reparto completo del título.
### Método pout
Devuelve la sinopsis del título, se puede pasar como valor el idioma en el que se desee la respuesta, el valor por defecto es en inglés. 

## Class Actor
Esta clase se encarga de almacenar la información de la llamada de los actores. 
Pará instanciar el objeto se puede hacer a través de Actor.new o TheWhos.create pasando como parámetro el ID de el actor de IMDB. 
### Método id
Devuelve el ID del título.
### Método name
Devuelve el nombre del actor.
### Método kron
Devuelve las películas mas conocidas del actor.

### Método cast
Devuelve todas las películas en las que el actor a participado.

## Class TheWhos
Está es la clase principal para trabajar con la información obtenida de las consultas la api de IMDB.
### Método create
Con este método se puede instanciar un objeto, detecta automáticamente si es una película o un actor y crea la clase correspondiente.
### Método seach_title
Devuelve un array con el ID y título de la películas que coincidan con el parámetro acicnado. 
### Método seach_actor
Devuelve un array con el ID y nombre del actor que coincida con el parámetro acicnado. 
### Método macht_actor 
Devuelve un array con el ID y nombre de los actores que coincidan entre dos películas, si es que lo hay, se puede pasar como parámetro el ID del título de IMDB o un objeto ya instanciado de una película. 
### Método macht_title
Devuelve un array con el ID y nombre de las películas que coincidan entre dos actores, si es que lo hay, se puede pasar como parámetro el ID del actor de IMDB o un objeto ya instanciado de un actor.
### Método who
Devuelve el personaje que interpreta un actor en una película, si es que actúa en esa película, se puede pasar como parámetros los ID de IMDB o los objetos ya instanciados. 
