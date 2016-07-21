PROCEDURE InvertirEnPila (pila: TipoPila; VAR pila2: TipoPila);
VAR
	auxElemento: TipoElemento;

BEGIN
	WHILE (pila <> NIL) DO
	BEGIN
		Cima(pila, auxElemento);
		Desapilar(pila);
		Apilar(auxElemento, pila2);
	END;
END;