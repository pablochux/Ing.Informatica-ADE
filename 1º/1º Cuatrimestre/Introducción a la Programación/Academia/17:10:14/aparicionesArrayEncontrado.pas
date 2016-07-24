PROGRAM programEncontrado;
{Programa que encuentra el caracter  y te dice el número de apariciones de el caracter}
CONST
	MIN = 1;
	MAX = 10;

TYPE
	{Declaración del rango del vector}
	TipoRangoLetras = MIN..MAX;
	{Declaración del tipo del vector}
	TipoVectorLetras = ARRAY [TipoRangoLetras] of Char;

VAR
	{Declaración del vector}
	Letras: TipoVectorLetras;
	i: Integer;
	{Variable para saber el número de apariciones del caracter}
	apariciones: Integer;

BEGIN
	apariciones:= 0;
	{Se rellena el array de valores}	
	FOR i:=MIN TO MAX DO
	BEGIN
		readln(letras[i]);
	END;	
	FOR i:= MIN TO MAX DO
	BEGIN	
		IF (letras[i] = 'j') THEN
		BEGIN
			apariciones:= apariciones + 1;
		END;
	END;
	writeln('La j está ', apariciones, ' veces');
END.

