{Ejemplo para considerar el nivel de ruido, si está entre 4 y 6 estará bien. Menos que 4 está genial. Si es superior a 6 será nocivo}
PROGRAM NivelRuido;
CONST 
	MAX_RUIDO_NOCIVO = 6;
	MIN_RUIDO_NOCIVO = 4;
VAR
	nivel_Ruido: integer;
BEGIN
writeln('Introduzca el nivel de ruido de su ciudad');
read(nivel_Ruido);
{Si el ruido es un número negativo}
IF ( nivel_Ruido < 0) THEN
BEGIN
	writeln('Los datos introducidos no son correctos')
END

ELSE 
	BEGIN
		{Si el ruido está entre 4 y 6 (MIN_RUIDO_NOCIVO y MAX_RUIDO_NOCIVO)}
		IF ( nivel_Ruido >= MIN_RUIDO_NOCIVO ) AND (nivel_Ruido <= MAX_RUIDO_NOCIVO)THEN
		BEGIN
			writeln('¡El ruido de tu ciudad no es nocivo!');
		END
			{Si el ruido está entre 0 y 4 (MIN_RUIDO_NOCIVO)}
			ELSE IF (nivel_Ruido > 0) AND (nivel_Ruido <= MIN_RUIDO_NOCIVO) THEN
			BEGIN
				writeln('El ruido de tu ciudad está genial');
			END
			{Si el ruido es igual a 0}
			ELSE IF (nivel_Ruido = 0) THEN
			BEGIN
				writeln('No hay ruido en tu ciudad');
			END
			{Para los demás casos}
			ELSE	
			BEGIN
				writeln('¡El ruido de tu ciudad es nocivo!');
			END
	END;

END.