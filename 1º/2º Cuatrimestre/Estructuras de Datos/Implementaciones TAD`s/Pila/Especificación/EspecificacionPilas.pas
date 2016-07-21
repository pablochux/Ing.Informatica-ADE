ESPECIFICACION Pilas
PARAMETROS GENERICOS
	Tipos
		TipoElemento
FIN PARAMETROS GENERICOS

Operaciones
	CrearPilaVacia: -> TipoPila
	Apilar: TipoElemento x TipoPila -> TipoPila

	{PARCIAL} Cima: TipoPila -> TipoElemento
	{PARCIAL} Desapilar: TipoPila -> TipoPila

	EsVacia: TipoPila -> Booleano

Ecuaciones de definitud
	Si NO (EsVacia(pila))
		DEF (Cima(pila))
	Si NO(EsVacia(pila))
		DEF (Desapilar(pila)))
Ecuaciones
	Cima(Construir(e, pila)) =
		e

	Desapilar(Construir(e, lista)) =
		lista

	EsVacia(CrearPilaVacia) = VERDADERO
	EsVacia(Construir(e, pila)) = FALSO
