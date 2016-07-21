{Se da el tipo de una lista circular con puntero al final}
TYPE
	TipoLista = ^TNodo;
	TNodo = RECORD
		e: TElem;
		sig: TipoLista;
	END;

PROCEDURE InsertarCabecera (VAR lista: TipoLista; elem: TElem);
VAR
	auxLista: TipoLista;

BEGIN
	NEW(auxLista);
	Copiar(auxLista^.e, elem);
	IF (EsListaVacia(lista)) THEN 
	BEGIN
		auxLista^.sig:= auxLista;
		lista:= auxLista;
	END
	ELSE 
	BEGIN
		auxLista^.sig:= lista^.sig;
		lista^.sig:= auxLista;
	END;
END;