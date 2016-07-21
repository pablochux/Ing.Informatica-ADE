{Eliminar el N esimo elemento de un cola con el TAD COLA (no utilizar punteros)}
PROCEDURE DeleteN (tail: TypeTail; n: Integer);
VAR
	auxTail: TypeTail;
	counter: Integer;
	e: TipoElemento;
	
BEGIN
	CreateEmptyTail(auxTail);
	WHILE (NOT IsEmptyTail(tail)) DO
	BEGIN
		{Si no es el elemento que se quiere eliminar, se inserta en la cola auxiliar y se elimina de la cola}
			n:= n - 1;IF (n <> 0) THEN 
		BEGIN
			First(tail, e);
			Delete(tail);
			Insert(e, auxTail);
		END
		{Si es el elemento que se quiere eliminar, no se inserta}
		ELSE 
		BEGIN
			Delete(tail)
		END;
	
	END;
	{Ahora tenemos en la cola todos los elementos que queremos (se ha eliminado el que no queriamos). Por lo cual se copia auxCola a cola.}
	WHILE (NOT EsColaVacia(auxTail)) DO
	BEGIN
		First(auxTail, e);
		Delete(auxTail);
		Insert(e, tail)
	END;
END;