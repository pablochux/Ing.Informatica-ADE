{Se utiliza el TAD Lista y el TAD Arbol}

{Se pide implementar un procedimiento que encuentre un camino de suma k. La suma del arbol solo puede terminar en la hoja, sino no sirve}
PROCEDURE EncontrarCaminoDeSumaK (k: Integer; ab: TipoArbolBinario; suma_camino_actual: Integer; VAR suman_k: TipoLista; encontrado: Boolean);
VAR
	encontrado: Boolean;
	
BEGIN
	{Caso base, si el árbol es vacio}
	IF (EsArbolVacio(ab)) THEN 
	BEGIN
		CrearListaVacia(suman_k);
		encontrado:= FALSE;
	END
	ELSE 
	BEGIN
		{Se destripa el árbol}
		Raiz(ab, auxRaiz);
		HijoDer(ab, auxHd);
		HijoIzq(ab, auxHi);
		
		{Si es una hoja}
		IF (EsArbolVacio(auxHd)) AND (EsArbolVacio(auxHi)) THEN 
		BEGIN
			{Se comprueba si la suma es la pedida}
			IF (suma_camino_actual + auxRaiz = k) THEN 
			BEGIN
				CrearListaVacia(suman_k);
				InsertarFinal(auxRaiz, suman_k);
				encontrado:= TRUE;
			END
			{Sino es la pedida, se devuelve false}
			ELSE 
			BEGIN
				encontrado:= FALSE;
			END;
		END
		{Si no es una hoja}
		ELSE 
		BEGIN
			{Se aumenta el contador con la suma}
			suma_camino_actual:= suma_camino_actual + auxRaiz;
			{Se llama a la función con el hijo izquierdo}
			EncontrarCaminoDeSumaK(k, auxHi, suma_camino_actual, suman_k, encontrado);
			IF (NOT encontrado) THEN 
			BEGIN
				{Sino se ha encontrado con el hijo izquierdo, se llama a la función por el hijo derecho}
				EncontrarCaminoDeSumaK(k, auxHd, suma_camino_actual, suman_k, encontrado);
			END
			{Si ya se ha encontrado el camino, se va construyendo la lista con los nodos}
			IF (encontrado) THEN 
			BEGIN
				Construir(r, suman_k);
			END
			{Sino, se va aumentando el contador}
			ELSE 
			BEGIN
				suma_camino_actual:= suma_camino_actual - auxRaiz;
			END;
		END;
	END;
END;