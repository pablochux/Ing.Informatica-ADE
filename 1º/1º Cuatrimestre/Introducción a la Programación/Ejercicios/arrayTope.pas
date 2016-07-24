PROGRAM pTope;
TYPE
	TipoArray = ARRAY[1..5] of Integer;

VAR
	top: Integer;
	vector: TipoArray;
	i, num: Integer;
PROCEDURE Add (VAR vector: TipoArray; VAR top: Integer);
BEGIN
	IF (top <= 5) THEN
	BEGIN
		top:= succ(top);
		writeln('Posición número ', top);
		readln(vector[top]);
	END;
END;
BEGIN
top:= 0;
writeln('¿Cuantas posiciones del array quieres rellenar?');
readln(num);
FOR i:=1 TO num DO
BEGIN
	Add(vector, top);
END;
END.