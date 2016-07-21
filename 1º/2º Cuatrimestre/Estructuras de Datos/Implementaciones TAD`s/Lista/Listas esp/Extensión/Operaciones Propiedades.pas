ESPECIFICACION ListaExtension
USA Listas
{Parametros genéricos en el caso de las operaciones es que todas las operaciones los utilizan, si no todas las operaciones las utilizan, se pone encima de la operación que lo utilice
Ejemplo: 

PARAMETROS GENÉRICOS
	OPERACIONES
		Propiedad: TipoElemento -> Booleano

FIN PARAMETROS GENERICOS

(Existe propiedad necesita los parametros genericos)
ExistePropiedad: TipoLista -> Booleano

(Esta no lo necesita, por lo que no lleva nada)
PrimeroPropiedad: TipoLista -> TipoElemento 

PARAMETROS GENÉRICOS
	OPERACIONES
		Propiedad: TipoElemento -> Booleano

FIN PARAMETROS GENERICOS}
Operaciones 
UltimoPropiedad: TipoLista -> TipoElemento5

PARAMETROS GENÉRICOS
	OPERACIONES
		Propiedad: TipoElemento -> Booleano
FIN PARAMETROS GENERICOS

OPERACIONES
	{Devuelve el valor booleano si existe un elemento que cumpla la propiedad}
	ExistePropiedad: TipoLista -> Booleano
	{Devuelve el primer elemento que cumpla la Propiedad}
	{PARCIAL} PrimeroPropiedad: TipoLista -> TipoElemento
	{Devueve el último elemento que cumpla la Propiedad}
	{PARCIAL} UltimoPropiedad: TipoLista -> TipoElemento5

VARIABLES
	lista: TipoLista
	e: TipoElemento

Ecuaciones de definitud
	Si ExistePropiedad(lista)
		DEF (PrimeroPropiedad(lista))
	Si ExistePropiedad(lista)
		DEF (UltimoPropiedad(lista))

Ecuaciones
	ExistePropiedad(CrearVacia) = FALSO
	ExistePropiedad(Construir(e, lista)) =
		Si Propiedad(e) ->
			CIERTO
		| ExistePropiedad(lista)
		{En este caso no se tiene que devolver la lista, por lo que no hay que Construir, en este tipo de operaciones es como si la lista estuviera por valor, por lo que no se pierde si no ponemos el construir}

	PrimeroPropiedad(Construir(e, lista)) =
		Si Propiedad(e) ->
			e
		| PrimeroPropiedad(lista)

	UltimoPropiedad(Construir(e, lista)) =
		Si Propiedad(e) Y NO ExistePropiedad(lista) ->
			e
		| UltimoPropiedad(lista)

FIN ESPECIFICACION