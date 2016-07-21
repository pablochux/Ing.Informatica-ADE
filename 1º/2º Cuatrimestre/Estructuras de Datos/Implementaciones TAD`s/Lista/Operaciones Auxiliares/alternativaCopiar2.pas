{Se pide implementar la operación Copiar, teniendo en cuenta que puede haber más nodos en destino que deberan ser guardados}
PROCEDURE Copiar (VAR destino: TListasEspecial: origen: TListasEspecial);
VAR
	auxLista1, auxLista2: TListasEspecial;

BEGIN
	auxLista1:= origen;
	auxLista2:= destino;
	WHILE (auxLista1 <> NIL) AND (auxLista2 <> NIL)  DO
	BEGIN
		auxLista^.info:= auxLista1^.info;
		auxLista1:= auxLista1^.sig;
		auxLista2:= auxLista2^.sig;
	END;
	{Si la lista origen es NIL pero la lista destino No}
	IF (auxLista1 = NIL) AND (auxLista2 <> NIL) THEN 
	BEGIN
		WHILE (auxLista2 <> NIL) DO
		BEGIN
			auxLista1:= auxLista2;
			auxLista2:= auxLista2^.sig;
			DISPOSE(auxLista1);
		END;
		auxLista2:= destino;
		FOR i:=1 TO cont-2 DO
		BEGIN
			auxLista2:=auxLista2^.sig;
		END;
		auxLista2^.post_sig:= NIL;
		auxLista2:= auxLista2^.sig;
		auxLista2^.post_sig:= NIL;
		auxLista2^.sig:= NIL;
	END
	{Si la lista origen no es NIL pero la lista destino sí}
	ELSE IF (auxLista1 <> NIL) AND (auxLista2 = NIL) THEN 
	BEGIN
		WHILE (auxLista1 <> NIL) DO
		BEGIN
			InsertarFinal(auxLista1^.info, destino);
			auxLista1:= auxLista1^.sig;
		END;
		auxLista2:= destino;
		WHILE (auxLista2 <> NIL) DO
		BEGIN
			IF (auxLista2^.sig <> NIL) THEN 
			BEGIN
				auxLista2^.post_sig^sig;
			END;
			auxLista2:= auxLista2^.sig;
		END;
	END;
END;


PROCEDURE InsertarFinal (VAR lista: TipoLista);
VAR
	auxLista: TipoLista;

BEGIN
	nuevo:= CrearNodo(e, NIL, NIL);
	IF (lista = NIL) THEN 
	BEGIN
		lista:= NIL;
	END
	ELSE 
	BEGIN
		auxLista:= lista;
		WHILE (auxLista^.sig <> NIL) DO
		BEGIN
			auxLista:= auxLista^.sig;
		END;
		auxLista^.sig:= nuevo;
	END;
END;