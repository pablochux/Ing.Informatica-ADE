{Especificación operación BorrarUltimo de una lista como extensión del TAD Lista}
ESPECIFICACION ListasExtension
USA Listas 

OPERACIONES
	BorrarUltimo: TipoLista -> TipoLista

VARIABLES
	e: TipoElemento
	lista: TipoLista

ECUACIONES
	BorrarUltimo(CrearVacia) = CrearVacia
	BorrarUltimo(Construir(e, lista)) =
		Si EsVacia(lista) ->
			CrearVacia
		| Construir(e, BorrarUltimo(lista))
		{Como se saca el elemento pero no es el que se quiere borrar, se mete y se sigue buscando por la lista}
		{ BorrarUltimo(lista), si se pone esto se estaría borrando toda la lista hasta el último elemento, ya que has desconstruido el Construir y no lo has vuelto a meter}
FIN ESPECIFICACION