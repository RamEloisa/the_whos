# The Whos
## Instalacion
Instalar a través de Rubygems
```
gem install the_whos
```
Accede a la biblioteca en Ruby:
```
require 'the_whos'
```
## Api Key IMDB
Para poder realizar llamadas se requiere ingresar la clave de la api de IMDB, para obtener una clave gratuita tiene que registrase en el sitio de la API, [IMDB API](https://imdb-api.com/Identity/Account/Register), las cuentas gratuitas tienen un límite de 100 consultas por día.
Pará poder utilizar la clave se tiene que pasar el valor en la línea de comandos antes de ejecutar el script. 
```
$ ruby example.rb  k_12345678
```
## Class Title 
Esta clase se encarga de almacenar la información de la llamada de los títulos. 
Pará instancia el objeto se puede hacer a través de `Title.new` o `TheWhos.create` pasando como parámetro el ID de el título de IMDB. 
```
movie = Title.new('tt0088763')

movie = TheWhos.create('tt0088763')
```
### Método id
Devuelve el ID del título.
```
movie = Title.new('tt0088763')
movie.id

# => "tt0088763"
```
### Método title
Devuelve el título. 
```
movie = Title.new('tt0088763')
movie.title

# => "Back to the Future"
```
### Método cast
Devuelve un array con los 10 actores principales
```
movie = Title.new('tt0088763')
movie.cast
```
### Método fullcast
Devuelve un array con el reparto completo del título.
```
movie = Title.new('tt0088763')
movie.fullcast
```
### Método plot
Devuelve la sinopsis del título, se puede pasar como valor el idioma en el que se desee la respuesta, el valor por defecto es en inglés. 
```
movie = Title.new('tt0088763')
movie.plot('es')
```

## Class Actor
Esta clase se encarga de almacenar la información de la llamada de los actores. 
Pará instancia el objeto se puede hacer a través de `Actor.new` o `TheWhos.create` pasando como parámetro el ID de el actor de IMDB.
```
fox = Actor.new('nm0000150')

fox = TheWhos.create('nm0000150')
```
### Método id
Devuelve el ID del actor.
```
fox = Actor.new('nm0000150')
fox.id

# => "nm0000150"
```
### Método name
Devuelve el nombre del actor.
```
fox = Actor.new('nm0000150')
fox.name

# => "Michael J. Fox"
```
### Método known
Devuelve un array de las películas mas conocidas del actor.
```
fox = Actor.new('nm0000150')
fox.known
```

### Método cast
Devuelve todas las películas en las que el actor a participado.
```
fox = Actor.new('nm0000150')
fox.cast
```

## Class TheWhos
Está es la clase principal para trabajar con la información obtenida de las consultas la api de IMDB.
### Método create
Con este método se puede instanciar un objeto, detecta automáticamente si es una película o un actor y crea la clase correspondiente.
```
movie = TheWhos.create('tt0088763')
fox = TheWhos.create('nm0000150')
```
### Método search_title
Devuelve un array con el ID y título de la películas que coincidan con el parámetro.
```
rest = TheWhos.search_title('back to the future')
```
### Método search_actor
Devuelve un array con el ID y nombre del actor que coincida con el parámetro.
```
rest = TheWhos.search_actor('michael fox')
```
### Método match_actor 
Devuelve un array con el ID y nombre de los actores que coincidan entre dos películas, si es que lo hay, se puede pasar como parámetro el ID del título de IMDB o un objeto ya instansiado de una película.
```
match = TheWhos.match_actor ('tt0088763','tt0101272')
```
### Método match_title
Devuelve un array con el ID y nombre de las películas que coincidan entre dos actores, si es que lo hay, se puede pasar como parámetro el ID del actor de IMDB o un objeto ya instanciado de un actor.
```
match = TheWhos.match_title ('nm0000150', 'nm0000502')
```
### Método who
Devuelve el personaje que interpreta un actor en una película, si es que actúa en esa película, se puede pasar como parámetros los ID de IMDB o los objetos ya instanciados.
```
charater = TheWhos.who ('tt0088763', 'nm0000150') 

# => "Marty McFly"
```
