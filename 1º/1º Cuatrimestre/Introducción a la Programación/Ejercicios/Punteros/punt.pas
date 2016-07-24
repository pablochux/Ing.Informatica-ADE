PROGRAM punteros;
TYPE
	punt = ^Integer;
VAR
	puntero: punt;
BEGIN
	{Se crea la variable dinámica puntero, que por ahora tendrá un contenido desconocido.}
	New(puntero);
	{Se lee el dato al que apunta puntero}
	readln(puntero^);
	{Se escribe el dato que contiene puntero^}
	writeln(puntero^);
	puntero^:= pred(puntero^);
	writeln(puntero^);
	{Se elimina el puntero}
	dispose(puntero);
END.