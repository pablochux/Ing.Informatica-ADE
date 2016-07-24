PROGRAM punteros;
TYPE
	punt = ^Integer;
VAR
	puntero: punt;
	puntero2: punt;
BEGIN
	New(puntero);
	New(puntero2);
	readln(puntero^);
	writeln(puntero^);
	dispose(puntero2);
	puntero:= puntero2;
	puntero2^:= 6;
	writeln(puntero^);
	{Se elimina el puntero}
	dispose(puntero);
END.