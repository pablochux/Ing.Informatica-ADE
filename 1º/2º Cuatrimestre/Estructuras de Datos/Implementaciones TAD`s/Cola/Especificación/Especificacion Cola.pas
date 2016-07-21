ESPECIFICACION COLA
PARAMETROS GENERICOS
	Tipo
		TipoElemento
FIN PARAMETROS GENERICOS
Tipos
	TipoCola

OPERACIONES
	CrearColaVacia: -> TipoCola
	Construir: TipoElemento x TipoCola -> TipoCola

	EsColaVacia: TipoCola -> Booleano
	Borrar: TipoCola -> TipoCola

	{PARCIAL} Primero: TipoCola -> TipoElemento

	{PARCIAL} Eliminar: TipoCola -> TipoCola

VARIABLES
	cola: TipoCola
	e: TipoElemento

Ecuaciones de definitud
	Si NO(EsColaVacia(cola))
		DEF(Primero(cola))

	Si NO(EsColaVacia)
		DEF(Eliminar(cola))


Ecuaciones
	EsColaVacia(CrearColaVacia) = CIERTO
	EsColaVacia(Construir(e, cola)) = FALSO

	Borrar(Construir(e, cola))
		Si EsColaVacia(cola)
			cola
		| Construir(e, Eliminar(cola))

	Primero(Construir(e, cola)) =
		e
