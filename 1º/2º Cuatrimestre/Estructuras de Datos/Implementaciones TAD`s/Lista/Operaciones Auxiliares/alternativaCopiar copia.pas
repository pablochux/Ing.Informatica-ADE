{Forma alternativa del subprograma copiar de Lista dinámica simplemente enlazada. No se utiliza InsertarFinal para reducir la complejidad del subprograma}
PROCEDURE Copiar (VAR destino: TipoLista; origen: TipoLista);
VAR
	auxLista: TipoLista;

BEGIN
	CrearVacia(destino);
	WHILE (origen <> NIL) DO
	BEGIN
		NEW(auxLista);
		Elem.Asignar(origen^.info, auxLista^.info);
		{Como se inserta por el final, el sig será NIL}
		auxLista^.sig:= NIL;
		IF (destino = NIL) THEN 
		BEGIN
			destino:= auxLista;
		END
		ELSE
		BEGIN
			auxPuntero^.sig:= auxLista;
		END;
		{Va actualizando el puntero para que apunte al nuevo}
		auxPuntero:= auxLista; 
		{Se avanza el puntero de la lista origen}
		origen:= origen^.sig;
	END;
END;