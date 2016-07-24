{Procedimiento para considerar el nivel de ruido, si es =< 5 será nocivo}
PROGRAM NivelRuido;
CONST 
	TOPE_RUIDO_NOCIVO = 5;
VAR 
	nivel_Ruido: integer;
	PROCEDURE Ruido (n: integer);
	BEGIN
		readln(n);
		IF ( nivel_Ruido >= TOPE_RUIDO_NOCIVO ) THEN
		BEGIN
			writeln('¡El ruido de tu ciudad es nocivo!');
		END
		ELSE	
		BEGIN
			writeln('¡El ruido de tu ciudad no es nocivo!');
		END;

	END;
BEGIN
	Ruido(n);
END.