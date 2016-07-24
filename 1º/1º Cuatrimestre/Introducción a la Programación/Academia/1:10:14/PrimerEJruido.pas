{Ejemplo para considerar el nivel de ruido, si es =< 5 será nocivo}
PROGRAM NivelRuido;
CONST 
	TOPE_RUIDO_NOCIVO = 5;
VAR
	nivel_Ruido: integer;
BEGIN
writeln('Introduzca el nivel de ruido de su ciudad');
read(nivel_Ruido);
IF ( nivel_Ruido >= TOPE_RUIDO_NOCIVO ) THEN
BEGIN
	writeln('¡El ruido de tu ciudad es nocivo!'); 
END
ELSE	
BEGIN
	writeln('¡El ruido de tu ciudad no es nocivo!');
END;
END.