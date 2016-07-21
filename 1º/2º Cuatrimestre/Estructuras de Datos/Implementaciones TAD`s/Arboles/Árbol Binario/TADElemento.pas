UNIT TADElemento;
INTERFACE
	TYPE
		TipoElemento = Integer;

	{Cabeceras Subprogramas}
	PROCEDURE Asignar (elemento1: TipoElemento; VAR elemento2: TipoElemento);
	FUNCTION Iguales (elemento1, elemento2: TipoElemento): Boolean;
	
IMPLEMENTATION
	{Subprogramas}
	PROCEDURE Asignar (elemento1: TipoElemento; VAR elemento2: TipoElemento);
	BEGIN
		elemento2:= elemento1;
	END;

	FUNCTION Iguales (elemento1, elemento2: TipoElemento): Boolean;
	BEGIN
		Iguales:= (elemento1 = elemento2);
	END;

END.