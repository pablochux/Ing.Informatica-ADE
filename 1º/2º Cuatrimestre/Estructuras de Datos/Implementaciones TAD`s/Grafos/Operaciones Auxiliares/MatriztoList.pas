{Se pide un ejercicio que devuelva}

{Es un grafo dirigido y valorado, como es valorado tiene números, si tiene 0 no existe, si hay un número sí}
{a}
PROCEDURE Matrix2List (matriz: TMatrizAdy; VAR lista: TListaAdyacencia);
VAR
	i: Integer;
BEGIN
	CrearListaVacia(lista);
	FOR i:=1 TO MAX_NUM DO
	BEGIN
		{Se buscan en la diagonal}
		IF (matriz[i, i] <> 0) THEN 
		BEGIN
			InsertarNodo(lista, i);
		END;
	END;
	FOR i:=1 TO MAX_NUM DO
	BEGIN
		FOR j:=1 TO MAX_NUM DO
		BEGIN
			IF (matriz[i, j] <> 0) AND (i <> j) THEN 
			BEGIN
				InsertarArco(i, j, matriz[i, j], lista);
			END;
		END;
	END;
END;
{b}
PROCEDURE Lista2Matrix (lista: TListaAdyacencia;VAR matriz: TMatrizAdy);
VAR
	auxGrafo: TADyacencia;
BEGIN
	{Se inicializa la matriz a 0 }
	FOR i:=1 TO MAX_NUM DO
	BEGIN
		FOR j:=1 TO MAX_NUM DO
		BEGIN
			matriz[i, j]:= 0;
		END;
	END;
	{Procedimiento se recorre una posición, se sacan los elementos que esten en la lista de adyacencia de cada nodo y se va pasando}
	WHILE (grafo <> NIL) DO
	BEGIN
		i:= grafo^.dato;
		auxGrafo:= grafo^.adyacentes;
		InsertarNodo()
		WHILE (auxGrafo <> NIL) DO
		BEGIN
			{i es el nodo, }
			InsertarArco(i, auxGrafo^.dato, auxGrafo^.peso, matriz);
			auxGrafo:= auxGrafo^.sig;
		END;
		grafo:= grafo^.sig;
	END;
END;