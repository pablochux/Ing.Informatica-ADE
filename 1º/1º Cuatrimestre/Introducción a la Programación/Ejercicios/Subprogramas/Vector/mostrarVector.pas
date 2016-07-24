{Subprograma que muestra un array de una dimensión}
{En la sección VAR}
PROCEDURE DisplayArray (vector: TipoVector);
	VAR
		i: Integer;
	BEGIN
		FOR i:= MIN TO MAX DO
		BEGIN
			writeln(vector[i]);
		END;
	END;

{En el programa principal}
DisplayArray (vector);
