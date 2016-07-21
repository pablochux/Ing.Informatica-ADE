UNIT TADCoste;
INTERFACE	
	TYPE	
		{TipoCoste es el tipo utilizado para establecer el coste de una arista}
		TipoCoste = Real;

	{Cabeceras Subprogramas}
	PROCEDURE Asignar (coste1: TipoCoste; VAR coste2: TipoCoste);
	FUNCTION Iguales (coste1, coste2: TipoCoste): Boolean;

IMPLEMENTATION
	{Subprogramas}
	PROCEDURE Asignar (coste1: TipoCoste; VAR coste2: TipoCoste);
	BEGIN
		coste2:= coste1;
	END;		
	FUNCTION Iguales (coste1, coste2: TipoCoste): Boolean;
	BEGIN
		Iguales:= (coste1 = coste2);
	END;
END.