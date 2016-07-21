{Hacer una operación que dada una lista devuelva la misma lista con sus elementos agrupados. Por ejemplo: [1,4,5,3,2,1,1,4,6,5,7,6] sería [1,1,1,4,4,5,5,3,2,6,6,7]
Se debe usar el TAD Lista y la cabecera será la siguiente: PROCEDURE Agrupar (lista: Tlista; VAR lista2: Tlista);}

{}
PROCEDURE Agrupar (lista: TipoLista; VAR lista2: TipoLista);
VAR
	auxLista: TipoLista;

BEGIN
	{Se crea la lista que se va a devolver}
	CrearListaVacia(lista2);
	{Se copia la lista que se recibe a un auxiliar}
	Copiar(lista, auxLista);
	WHILE (auxLista <> NIL) DO
	BEGIN
		{Se saca el primero, se comprueba si pertenece o no y se va borrando e insertando el elemento hasta que no pertenezca y así con todos los elementos}
		Primero(lista, elemento);
		WHILE (Pertenece(auxLista, elemento)) DO
		BEGIN
			BorrarElemento(auxLista, elemento);
			InsertarFinal(lista2, elemento);
		END;			
	END;
END;

{ PROCEDIMIENTOS AUXILIARES }
PROCEDURE InsertarFinal (VAR lista: TipoLista; elemento: TipoElemento);
VAR
	auxLista, auxPuntero: TipoLista;

BEGIN
	NEW(auxLista);
	auxLista^.info:= info;
	auxLista^.sig:= NIL;
	auxPuntero:= lista;
	IF (NOT lista = NIL) THEN 
	BEGIN
		WHILE (auxPuntero^.sig <> NIL) DO
		BEGIN
			auxPuntero:= auxPuntero^.sig;
		END;
		auxPuntero^sig:= auxLista;
	END
	ELSE 
	BEGIN
		lista:= auxLista;
	END;
END;

FUNCTION Pertenece (lista: TipoLista; elemento: TipoElemento): Boolean;
VAR
	encontrado: Boolean;

BEGIN
	encontrado:= FALSE;
	WHILE (NOT encontrado) AND (lista <> NIL) DO
	BEGIN
		encontrado:= (lista^.info = elemento);
		IF (NOT encontrado) THEN 
		BEGIN
			lista:= lista^.sig;
		END;
	END;
END;
