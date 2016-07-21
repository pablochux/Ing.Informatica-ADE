	PROCEDURE BorrarNodo (VAR grafo: TipoGrafo; auxNodo: TipoNodo); 
	VAR
		i: Integer;
		
	BEGIN
		{Se busca en la diagonal de la matriz por el elemento y se pone a FALSE}
		FOR i:= Nodo.MIN TO Nodo.MAX DO
		BEGIN
			IF (i = auxNodo) THEN 
			BEGIN
				grafo[i, i]:= FALSE;
			END;
		END;
		{Una vez eliminado el nodo, se eliminan los arcos que pertenezcan a ese nodo}
		{En su misma columna}
		FOR i:= Nodo.MIN TO PRED(auxNodo) DO
		BEGIN
			grafo[i, auxNodo]:= FALSE;
		END;
		{En su misma fila}
		FOR i:= SUCC(auxNodo) TO Nodo.MAX DO
		BEGIN
			grafo[auxNodo, i]:= FALSE;
		END;	
	END;