PROGRAM P_Punt;
TYPE
	tipoPuntero = ^Integer;

VAR
	puntero, puntero2, aux: tipoPuntero;

BEGIN
	{Se inicializan los puntero}
	New(puntero);
	New(puntero2);
	{Se asignan valores a las variables referidas de los punteros}
	readln(puntero^);
	readln(puntero2^);
	{Se ordenan los punteros}
	IF (puntero^ < puntero2^) THEN
	BEGIN
		{puntero pasa a apuntar a apuntar a puntero2 y puntero2 pasa a apuntar a puntero}
		{Al hacerse el cambio de punteros, también se hace cambio de variables referidas}
		{Aux no es necesario inicializarla con New()????}
		{New(aux);}
		aux:= puntero2;
		puntero2:= puntero;
		puntero:= aux;
		Dispose(aux);
	END;
	writeln(puntero^);
	writeln(puntero2^);
END.