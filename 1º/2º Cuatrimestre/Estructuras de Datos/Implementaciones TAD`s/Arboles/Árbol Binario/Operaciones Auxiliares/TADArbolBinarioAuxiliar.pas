UNIT TADArbolBinarioAuxiliar;
INTERFACE
	USES TADArbolBinario;

{Cabeceras Subprogramas}

IMPLEMENTATION
{Subprogramas}
	{El subprograma devuelve la Longitud de un árbol}
	FUNCTION Longitud (arbolBinario: TipoArbolBinario): Integer;
	VAR
		hijoDer, hijoIzq: TipoArbolBinario;

	BEGIN
		{Caso base}
		IF (EsArbolBinarioVacio(arbolBinario)) THEN 
		BEGIN			
			Longitud:= 0;
		END
		ELSE 
		BEGIN
			{Se destripa el árbol}
			TADArbolBinario.HijoDerecho(arbolBinario, hijoDer);
			TADArbolBinario.HijoIzquierdo(arbolBinario, hijoIzq);
			{Como la raiz del árbol es distinto de 1, La longitud es 1 + La longitud del hijoIzquierdo + la longitud del hijoDerecho. Como los árboles son estructuras recursivas siempre se deberán recorrer de forma recursiva}
			Longitud:= 1 + Longitud(hijoDer) + Longitud(hijoIzq);
		END;		
	END;	

	{La función NumeroDeHojas devuelve el número de de hojas de un arbolBinario}
	{Una hoja es un nodo cuyos hijos derecho e izquierdo son vacio, es decir, es el último nodo de un árbol}
	FUNCTION NumeroDeHojas(arbolBinario: TipoArbolBinario): Integer;
	VAR
		hijoDer, hijoIzq: TipoArbolBinario;

	BEGIN
		{Caso base}
		IF (EsArbolBinarioVacio(arbolBinario)) THEN 
		BEGIN
			NumeroDeHojas:= 0;
		END
		ELSE 
		BEGIN
			{Se destripa el árbol}
			TADArbolBinario.HijoDerecho(arbolBinario, hijoDer);
			TADArbolBinario.HijoIzquierdo(arbolBinario, hijoIzq);
			{Si los dos hijos de un nodo son vacios significa que es una hoja}
			IF (EsArbolBinarioVacio(hijoDer) AND (EsArbolBinarioVacio(hijoIzq)) THEN 
			BEGIN
				NumeroDeHojas:= 1;
			END
			{Sino, se sigue buscando por los hijos del arbol recursivamente}
			ELSE 
			BEGIN
				NumeroDeHojas:= NumeroDeHojas(hijoDer) + NumeroDeHojas(hijoIz);
			END;
		END;
	END;
END.		