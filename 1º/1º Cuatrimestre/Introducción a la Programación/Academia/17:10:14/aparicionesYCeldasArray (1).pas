PROGRAM programEncontrado;
{Programa que encuentra el caracter  y te dice el número de apariciones de el caracter.}
{Para hacer las casillas en las que aparece el caractere hay que crear otro array}
CONST
	MIN = 1;
	MAX = 10;

TYPE
	{Declaración del rango del vector}
	TipoRangoLetras = MIN..MAX;
	{Declaración del tipo del vector}
	TipoVectorLetras = ARRAY [TipoRangoLetras] of Char;
	{Declaración del tipo del vector que usaremos para almacenar las casillas}
	TipoVectoresCasillas = ARRAY[TipoRangoLetras] of Integer;
VAR
	{Declaración del vector}
	Letras: TipoVectorLetras;
	Posiciones: TipoVectoresCasillas;
	i, j: Integer;
	{Variable para saber el número de apariciones del caracter}
	apariciones: Integer;

BEGIN
	apariciones:= 0;
	{Se rellena el array de valores}	
	FOR i:=MIN TO MAX DO
	BEGIN
		readln(letras[i]);
	END;	
	{Búsqueda en el array}
	FOR i:= MIN TO MAX DO
	BEGIN	
		{Si encuentra el valor j}
		IF (letras[i] = 'j') THEN
		BEGIN
			{Se suma uno a la variable apariciones}
			apariciones:= apariciones + 1;
			{Se incluye la posición en la que ha sido encontrada la letra al array}
			posiciones[i]:= i;
		END;
	END;
	writeln('La j está ', apariciones, ' veces.');
	write('En las casillas ');

{Bucle para mostrar las casillas en las que aparece la letra especificada}
	FOR i:= MIN TO MAX DO
	BEGIN
		IF (posiciones[i] <> 0) THEN
		BEGIN
		write(posiciones[i], ' ');
		END;
	END;
	writeln('.');

END.

