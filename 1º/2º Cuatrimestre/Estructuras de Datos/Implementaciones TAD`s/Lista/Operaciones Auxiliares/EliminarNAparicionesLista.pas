{Se pide realizar un subprograma que elimina las primeras N apariciones de un elemento en la lista}
PROCEDURE EliminarOcurrencias (VAR lista: TipoLista; elemento: Integer; n: Integer);
BEGIN
	{Como sabemos el número exacto de apariciones que tenemos que eliminar, llamamos ese número de veces a la función BorrarElemento, en el caso que la lista sea vacia, el borrar elemento no hace, por lo tanto la operacion no falla.}
	FOR i:=1 TO n DO
	BEGIN
		BorrarElemento(lista, elemento);
	END;
END;

{Procedimiento que elimina un archivo que se le pasa como parametro}
PROCEDURE BorrarElemento (VAR lista: TipoLista; elemento: Integer);
VAR
	encontrado: Boolean;
	auxPunteroAnterior, auxPunteroActual: TipoLista;

BEGIN
	encontrado:= FALSE;
	auxPunteroAnterior:= NIL;
	auxPunteroActual:= lista;
	WHILE (p <> NIL) AND (NOT encontrado) DO
	BEGIN
		encontrado:= (auxPunteroActual^.info:= e);
		IF (NOT encontrado) THEN 
		BEGIN
			auxPunteroAnterior:= auxPunteroActual;
			auxPunteroActual:= auxPunteroActual^.sig;
		END;
	END;
	IF (encontrado) THEN 
	BEGIN
		IF (auxPunteroAnterior = NIL) THEN 
		BEGIN
			lista:= lista^.sig;
		END
		ELSE 
		BEGIN
			auxPunteroAnterior^.sig:= auxPunteroActual^.sig;
		END;
		DISPOSE(auxPunteroActual);
	END;
END;