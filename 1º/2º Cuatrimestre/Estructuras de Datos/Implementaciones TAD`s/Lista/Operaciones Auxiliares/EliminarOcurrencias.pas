PROCEDURE EliminarOcurrencias (VAR array: TArrayDinamico; e: Integer; n: Integer);
BEGIN
	FOR i:=1 TO n DO
	BEGIN
		BorrarElemento(e, array);
	END;
END;
{Procedimiento que elimina un archivo que se le pasa como parametro}
PROCEDURE BorrarElemento (e: Integer; VAR array: TArrayDinamico);
VAR
	Encontrado: Boolean;
	pant, pe: TArrayDinamico;

BEGIN
	Encontrado:= FALSE;
	pant:= NIL;
	pe:= array;
	WHILE (p <> NIL AND NOT Encontrado) DO
	BEGIN
		Encontrado:= (pe^.info:= e);
		IF (NOT Encontrado) THEN 
		BEGIN
			pant:= pe;
			pe:= pe^.sig;
		END;
	END;
	IF (Encontrado) THEN 
	BEGIN
		IF (pant = NIL) THEN 
		BEGIN
			array:= array^.sig;
		END
		ELSE 
		BEGIN
			pant^.sig:= pe^.sig;
		END;
		DISPOSE(pe);
	END;
END;