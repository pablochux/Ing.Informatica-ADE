UNIT ConjuntoArcos;
INTERFACE
	USES Arco;
	TYPE
		{Implementación del TAD ConjuntoDeArcos mediante una lista simplemente enlazada en memoria dinámica}
		TipoConjuntoArcos = ^TipoArcosConjuntoArcos;
		TipoArcosConjuntoArcos = RECORD
			info: TipoArco;
			sig: TipoConjuntoArcos;
		END;
		
	{Cabeceras Subprogramas}

	{ CONSTRUCTORAS GENERADORAS }
	PROCEDURE CrearConjuntoVacio (VAR conjuntoDeArcos: TipoConjuntoArcos);
	PROCEDURE Poner (VAR conjuntoDeArcos: TipoConjuntoArcos; elemento: TipoArco);
	PROCEDURE Elegir (conjuntoDeArcos: TipoConjuntoArcos; VAR auxArco: TipoArco);

	{ OBSERVADORAS NO SELECTORAS }
	FUNCTION EsConjuntoVacio (conjuntoDeArcos: TipoConjuntoArcos): Boolean;
	FUNCTION Pertenece (conjuntoDeArcos: TipoConjuntoArcos; elemento: TipoArco): Boolean;

	{ CONSTRUCTORAS NO GENERADORAS }
	PROCEDURE Quitar (VAR conjuntoDeArcos: TipoConjuntoArcos; elemento: TipoArco);


IMPLEMENTATION
{Subprogramas}
	PROCEDURE CrearConjuntoVacio (VAR conjuntoDeArcos: TipoConjuntoArcos);
	BEGIN
		conjuntoDeArcos:= NIL;
	END;

	PROCEDURE Poner (VAR conjuntoDeArcos: TipoConjuntoArcos; elemento: TipoArco);
	VAR
		auxconjuntoArcos: TipoConjuntoArcos;

	BEGIN
		IF (NOT Pertenece(conjuntoDeArcos, elemento)) THEN {Una de las características de los conjuntos es que la idempotencia(no hay números repetidos, por lo que si se intenta Poner un número que ya está, se omite)}
		BEGIN
			NEW(auxconjuntoArcos);
			Arco.Asignar(elemento, auxconjuntoArcos^.info);
			auxconjuntoArcos^.sig:= conjuntoDeArcos;
			conjuntoDeArcos:= auxconjuntoArcos;
		END;
	END;

	PROCEDURE Elegir (conjuntoDeArcos: TipoConjuntoArcos; VAR auxArco: TipoArco);
	BEGIN
		Arco.Asignar(conjuntoDeArcos^.info, auxArco);
	END;

	{ OBSERVADORAS NO SELECTORAS }
	
	FUNCTION EsConjuntoVacio (conjuntoDeArcos: TipoConjuntoArcos): Boolean;
	BEGIN
		EsConjuntoVacio:= (conjuntoDeArcos = NIL);
	END;

	FUNCTION Pertenece (conjuntoDeArcos: TipoConjuntoArcos; elemento: TipoArco): Boolean;
	VAR
		encontrado: Boolean;

	BEGIN
		encontrado:= FALSE;
		WHILE (NOT encontrado) AND (conjuntoDeArcos <> NIL) DO
		BEGIN
			encontrado:= Arco.Iguales(elemento, conjuntoDeArcos^.info);
			IF (NOT encontrado) THEN 
			BEGIN
				conjuntoDeArcos:= conjuntoDeArcos^.sig;
			END;
		END;
		Pertenece:= encontrado;
	END;

	{ CONSTRUCTORAS NO GENERADORAS }

	PROCEDURE Quitar(VAR conjuntoDeArcos: TipoConjuntoArcos; elemento:TipoArco);
	VAR
		encontrado: Boolean;
		auxconjuntoArcos, auxconjuntoArcosAnt: TipoConjuntoArcos;

	BEGIN
		encontrado:= FALSE;
		auxconjuntoArcos:= conjuntoDeArcos;
		auxconjuntoArcosAnt:= NIL;
		WHILE (NOT encontrado) AND (auxconjuntoArcos <> NIL) DO
		BEGIN
			encontrado:= Arco.Iguales(auxconjuntoArcos^.info, elemento);
			IF (NOT encontrado) THEN 
			BEGIN
				auxconjuntoArcosAnt:= auxconjuntoArcos;
				auxconjuntoArcos:= auxconjuntoArcos^.sig;
			END;
		END;
		IF (encontrado) THEN 
		BEGIN
			IF (auxconjuntoArcosAnt = NIL) THEN 
			BEGIN
				conjuntoDeArcos:= NIL;
			END
			ELSE 
			BEGIN
				auxconjuntoArcosAnt^.sig:= auxconjuntoArcos^.sig;
			END;
			DISPOSE(auxconjuntoArcos);
		END;
	END;	
END.	