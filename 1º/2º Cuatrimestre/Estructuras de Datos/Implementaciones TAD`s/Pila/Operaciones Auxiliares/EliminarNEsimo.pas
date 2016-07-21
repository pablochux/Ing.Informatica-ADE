{Se pide implementar un subprograma que elimine el N ésimo elemento de una Pila}
PROCEDURE EliminarNEsimo (VAR pila: TipoPila; num: Integer);
VAR
	auxPila: TipoPila;
	auxElemento: TipoElemento;

BEGIN
	CrearPilaVacia(auxPila);
	WHILE (num <= 1) AND (pila <> NIL) DO
	BEGIN
		contador:= contador - 1;
		Cima(pila, auxElemento);
		Desapilar(pila);
		Apilar(auxPila);
	END;
	IF (num = 1) THEN 
	BEGIN
		Desapilar(pila)
		WHILE (auxPila <> NIL) DO
		BEGIN
			Cima(auxPila, auxElemento);
			Desapilar(auxPila);
			Apilar(pila);
		END;
	END;
END;
