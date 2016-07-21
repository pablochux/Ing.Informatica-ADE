{En árboles binarios de búsqueda, se quiere saber si dado un elemento se encuentra en una hoja}

{ Especificación }
{
	Especificacion ArbolesExt
	USA ArbolesBinBus
	OPERACIONES 
		Observadoras no selectoras
		EstaEnHojas: TipoElemento x TipoArbolBin -> Booleano
	Variables
			e, r: TipoElemento
			hd, hi: TipoArbolBin;

	Ecuaciones
		EstaEnHoja(e, CrearArBolBinVacio) = FALSE
		EstaEnHoja(e, ConstruirArbolBin(hi, r, hd)) = 
				Si e = r ->
					Si EsArbolBinVacio(hi) Y EsArboolBinVacio(hd) ->
						Cierto
					| FALSE
				|Si e > R ->
					EstaEnHoja(e, hd)
				| EstaEnHoja(e, hi)
	FIN ESPECIFICACION
}

{Se pide implementar una función que dado un arbol binario de búsqueda y un elemento, te devuelva si el árbol se encuentra en una hoja}
FUNCTION EstaEnHojas (arbol: TipoArbolBinBus; elemento: TipoElemento): ;
VAR
	
BEGIN
	{Caso base}
	IF (EsArbolBinVacio(arbol)) THEN 
	BEGIN
		EstaEnHoja:= FALSE;
	END
	ELSE 
	BEGIN
		{Se destripa}
		Raiz(arbol, r);
		HijoIzq(arbol, hi);
		HijoDer(arbol, hd);
		{Si la raiz es el elemento y son vacios}
		IF (Iguales(elemento, R)) AND (EsArbolBinVacio(hi) AND (EsArbolBinVacio(hd))) THEN 
		BEGIN
			EstaHoja:= TRUE;
		END
		{Si el elemento es mayor que la raiz, hay que buscar por el hijo derecho}
		ELSE IF (Mayor(elemento, r)) THEN 
		BEGIN
			EstaEnHoja:= EstaEnHoja(hd, elemento);
		END
		{Sino, será menor, por lo que se busca por el hijo izquierdo}
		ELSE 
		BEGIN
			EstaEnHoja:= EstaHoja(hi, elemento);
		END;
	END;
END;