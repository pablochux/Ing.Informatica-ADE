{Subprograma que recibe una pila y devuelve invertida}
PROCEDURE Invertir (VAR pila: TipoPila);
VAR
	auxPila, auxPila1: TipoPila;
	auxElemento: TipoElemento;

BEGIN
	CrearPilaVacia(auxPila);
	WHILE (pila <> NIL) DO
	BEGIN
		Cima(pila, auxElemento);
		Apilar(auxPila, auxElemento);
		Desapilar(pila);
	END;
	WHILE (auxPila <> NIL) DO
	BEGIN
		Cima(auxPila, auxElemento);
		Apilar(auxPila1, auxElemento);
		Desapilar(auxPila);
	END;
	WHILE (auxPila1 <> NIL) DO
	BEGIN
		Cima(auxPila1, auxElemento);
		Apilar(pila, auxElemento);
		Desapilar(auxPila);
	END;
END;