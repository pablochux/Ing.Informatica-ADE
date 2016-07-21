ESPECIFICACION
PARAMETROS GENERICOS
	Tipos
		TipoElemento
FIN PARAMETROS GENERICOS

Tipos
	TipoLista

VARIABLES
	e: TipoElemento
	lista: TipoLista

OPERACIONES
	CrearVacia: -> TipoLista
	Construir: TipoLista x TipoElemento -> TipoLista

	{Parcial} Primero: TipoLista -> TipoElemento
	{Parcial} Resto: TipoLista -> TipoLista
	{Parcial} Ultimo: TipoLista -> TipoElemento

	EsListaVacia: TipoLista-> Booleano
	Pertenece: TipoLista x TipoElemento -> Booleano
	Longitud: TipoLista -> Integer

	{Constructoras no generadoras}
	Eliminar: TipoLista x TipoElemento -> TipoLista
	Copiar: TipoLista x TipoLista -> TipoLista
	Iguales: TipoLista x TipoLista -> Booleano
	Concatenar: TipoLista x TipoLista -> TipoLista
	InsertarFinal: TipoLista x TipoElemento -> TipoLista

ECUACIONES DE DEFINITUD
	Si NO (EsListaVacia(lista)) ->
		DEF (Primero(lista))

	Si NO (EsListaVacia(lista)) ->
		DEF (Resto(lista))

	Si NO (EsListaVacia(lista)) ->
		DEF (Ultimo(lista))

ECUACIONES
	{Nunca se describe el funcionamiento de las constructoras generadoras}
	
	Primero(Construir(e, lista)) ->
		e

	Resto(Construir(e, lista)) ->
		lista

	Ultimo(Construir(e, lista))
		Si EsListaVacia(lista)
			e
		| Ultimo(lista)

	{Observadoras no selectroras}
	EsListaVacia(CrearVacia) = VERDADERO
	EsListaVacia(Construir(e, lista)) = FALSO

	Longitud(CrearVacia) = 0
	Longitud(Construir(e, lista)) =
		1 + Longitud(lista)

	Pertenece(e, CrearVacia) = FALSO
	Pertenece(e, Construir(e1, lista)) =
		Si e = e1 ->
			Cierto
		| Pertenece(e, lista)

	{Constructoras no generadoras}
	Eliminar(e, CrearVacia) = CrearVacia
	Eliminar(e, Construir(e1, lista)) =
		Si e = e1 ->
			lista
		| Construir(e1, Eliminar(e, lista))

	Copiar(lista, CrearVacia) = CrearVacia
	Copiar(lista, Construir(e, lista1))
		Si NO (EsListaVacia(lista1))
			InsertarFinal(e, Copiar(lista, lista1))

	{No corregida}
	Iguales(CrearVacia, CrearVacia) = Cierto
	Iguales(CrearVacia, Construir(e, lista1)) = FALSO
	Iguales(Construir(e, lista), CrearVacia) = FALSO
	Iguales(Construir(e, lista), Construir(e1, lista1))
		Si e1 <> e
			FALSO
		| Iguales(lista, lista1)

	InsertarFinal(e, CrearVacia) =
		Construir(e, CrearVacia)
	InsertarFinal(e, Construir(e1, lista)) =
		Si EsListaVacia(lista)
			Construir(e, lista)
		| Construir(e1, InsertarFinale(e, lista))

	Concatenar(lista, CrearVacia) = CrearVacia
	Concatenar(lista, Construir(e, lista)) =
		Construir(e, Concatenar(lista, lista1))