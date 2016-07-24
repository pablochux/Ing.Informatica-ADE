PROGRAM ordenarArrays;
{Ordenación por el algoritmo BubbleSot}
CONST
	MAX = 10;
	MIN = 1;

TYPE
	TipoRangoArray = MIN..MAX;
	TipoArray = ARRAY [TipoRangoArray] of Integer;

VAR
	array1: TipoArray;
	i, j, h, aux: Integer;

BEGIN
	writeln('Introduce los valores de tu array: ');
	FOR i:=MIN TO MAX DO
	BEGIN
		readln(array1[i]);
	END;
	writeln('Has terminado de introducir el Array.');
	{Sirve para llevar la cuenta que se hace de las pasadas del array y en cada pasada hasta que posición tengo que llegar}
	{Empieza valiendo MAX y le va restando uno tras otro hasta llegar a dos (9 iteraciones) que son las iteraciones que tiene que hacer dada la dimensión (MAX - 1)}
	FOR i:=MAX DOWNTO (MIN + 1) DO
	BEGIN
		{Sirve para hacer los intercambios en cada pasada}
		{i - 1 será el tope hasta donde tenga que llegar el barrido. La 1ª vez será 10 - 1 porque ya se ha colocado el último elemento}
		FOR j:=MIN TO i - 1 DO
		BEGIN
			{Se compara la primera caja con la segunda y si se cumple la condición se intercambian los valores }
			{Si se quiere hacer con ordinales se usa ord(array1[j]) aunque no hace falta, porque sabe ordenar caracteres entre si}
			{Si se quiere hacer la búsqueda al reves se inverte el signo > por <}
			IF (array1[j] > array1[j+1]) THEN
			BEGIN
				{Intercambio de valores de las variables}
				aux:= array1[j];
				array1[j]:=array1[j+1];
				array1[j+1]:= aux;
			END;
		END;
	END;
	writeln();
	writeln('Has terminado de ordenar el Array.');
	FOR h:=MIN TO MAX DO
	BEGIN
		writeln(array1[h]);
	END;
	writeln('Se ha terminado de mostrar tu array.');
END.