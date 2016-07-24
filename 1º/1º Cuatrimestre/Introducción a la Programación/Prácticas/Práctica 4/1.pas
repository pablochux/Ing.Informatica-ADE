PROGRAM negativo;
VAR
	num, aux: Integer;

BEGIN
	aux:= 0;
	REPEAT
		read(num);
		IF (num >= 0) THEN
			aux:= aux + num;
	UNTIL (num < 0);
	writeln(aux);
END.