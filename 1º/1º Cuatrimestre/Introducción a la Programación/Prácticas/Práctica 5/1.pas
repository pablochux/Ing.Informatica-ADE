PROGRAM traspuesta;
CONST
	MIN = 1;
	MAX = 100;

TYPE
	TipoRangoArray = MIN..MAX;
	TipoArray = ARRAY [TipoRangoArray] of char;

VAR
	charArray: TipoArray;
	caracter: Char;
	indice, i: Integer;

BEGIN
	indice:=0;
	REPEAT
		read(caracter);
		IF (caracter <> '.') THEN
		BEGIN
			indice:= indice + 1;
			charArray[indice]:= caracter;
		END;
	UNTIL (caracter = '.');
	IF indice<>0 THEN
	BEGIN
		FOR i:=indice DOWNTO MIN DO
		BEGIN
			write(charArray[i]);
		END;
		writeln;
	END;
END.