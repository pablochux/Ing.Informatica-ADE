PROGRAM caracteres;
VAR
	car1, car2, i, aux: Char;

BEGIN
	readln(car1);
	readln(car2);
	aux:= car1;
	FOR i:=car1 TO car2 DO
	BEGIN
		writeln(aux);
		aux:=(succ(aux));
	END;
END.	