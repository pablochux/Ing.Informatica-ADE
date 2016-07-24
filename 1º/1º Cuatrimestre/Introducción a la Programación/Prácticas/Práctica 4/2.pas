PROGRAM enteros;
VAR
	cantidadNum, i: Integer;
	num, sumaNum, media: Real;

BEGIN
	readln(cantidadNum);
	sumaNum:= 0;
	FOR i:=1 TO cantidadNum DO
	BEGIN
		read(num);
		sumaNum:= num + sumaNum;
	END;
	media:= (sumaNum / cantidadNum);
	writeln(media:0:3);
END.