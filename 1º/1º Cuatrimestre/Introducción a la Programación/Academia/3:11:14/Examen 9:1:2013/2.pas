{Ejercicio2}
CONST
	MIN = 1;
	MAX = 200;
TYPE
	TipoIndice = MIN..MAX;
	TipoElemento = Integer;
	TipoValores = ARRAY [TipoIndice] of TipoElemento;
	TipoMatriz = ARRAY [TipoIndice, TipoIndice] OF TipoElemento;
{a) Dados los datos:}
{Realizar un subprograma que reciba un array de tipoValores y que devuelva true si la primera mitad del array y es identica a la segunda}

FUNCTION EsIgualMitad (valores: TipoValores): Boolean ;
VAR 
	mitad: Integer;
	i: Integer;
	esIgual: Boolean;
BEGIN
	mitad:= (MIN + MAX) DIV 2;
	i:= MIN;
	esIgual:= True;
	WHILE (esIgual) AND (i <= mitad) DO
	BEGIN
		esIgual:= (valores[i] = valores[mitad+i])
		IF (esIgual) THEN
		BEGIN
			i:= i + 1;
		END;
	END;
	EsIgualMitad:= esIgual;
END;

{b) Realizar un subprograma que reciba un array del tipo Tipovalores y devuelva el array desplazado hacia la derecha una posición}
{almaceno el valor "peculiar" del desplazamiento}
PROCEDURE DesplazarDerecha (VAR valores: TipoValores);
VAR
	aux:= TipoValores;
	i: Integer;
BEGIN
	aux:= valores[max];
	FOR i:=MAX - 1  DOWNTO MIN DO
	BEGIN
		valores[i+1]:= valores[i];
	END;
	valores[MIN]:= aux;
END;

{c) Realizar un subprograma que reciba una matriz de tipo matriz y rellene sus elementos con el valor de su posición. Suponiendo que el primer elemento (Fila 1 columna 1) esta en la primera posición y que el último elemento (fila max columna max) esta en la posición max * max. Se supone que son por filas}

PROCEDURE RellenarFuncion (VAR matriz: tipoMatriz);
VAR
	fila, columna, aux: Integer;
BEGIN
	aux:= 0;
	FOR fila:=MIN TO MAX DO
	BEGIN
		FOR columna:=MIN TO MAX DO
		BEGIN
			matriz[fila][columna] = aux;
			aux:= aux + 1;
		END;
	END;
END;

{d) Programa principal con su variables etc que inicialize un array y diga si la primera mitad es igual a la mitad, que a continuación desplaze una posición los elementos del array y vuelva a comprobar si la primera mitad es igual a la segunda.
Se da: PROCEDURE Inicializar (VAR valores: TipoValores)}
VAR
	valores: Tipovalores;
BEGIN
	Inicializar(valores);
	IF (EsIgualMitad(valores)) THEN
	BEGIN
		writeln("Igual");
	END
	ELSE 
	BEGIN
		writeln("No igual");
	END;
	Desplazar(Valores);
		IF (EsIgualMitad(valores)) THEN
	BEGIN
		writeln("Igual");
	END
	ELSE 
	BEGIN
		writeln("No igual");
	END;
END;










