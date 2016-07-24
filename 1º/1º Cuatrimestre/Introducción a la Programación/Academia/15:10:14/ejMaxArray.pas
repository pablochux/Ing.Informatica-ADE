PROGRAM arrays;
{Programa que busca en un array el valor máximo}
CONST 
	MIN = 1;
	MAX = 10;

TYPE
	TipoRangoVector = MIN..MAX;
	TipoVector= ARRAY [TipoRangoVector] OF Integer;

VAR
	vector: TipoVector;
	i: Integer;
	{maxValor será el numero máximo}
	maxValor: integer;

BEGIN
	{Leer un vector}
	FOR i:=MIN to MAX DO
	BEGIN
		write('vector[', i, '] = ');
		readln(vector[i]);
	END;
	{Siempre hay que inicializar maxValor con un miembro del array para evitar errores con números negativos o similares}
	maxValor:= vector[MIN];
	{El for va desde el sucesor de MIN (ya que MIN ya lo tenemos arriba) hasta MAX, que es el final del array.}
	FOR i:=succ(MIN) TO MAX DO
	{En cada iteración la variable i aumenta, por lo que el indice del array también aumenta y va comparando todos los indices}
	BEGIN
		IF (vector[i] > maxValor) THEN
		BEGIN
			{Si el número almacenado en vector[i] es mayor que maxValor sea signa a maxValor el valor de vector[i]}
			maxValor:= vector[i];
		END;
	END;
	writeln(maxValor);
END.