PROGRAM hundirLaFlota;
CONST
	MIN_FILA = 'A';
	MAX_FILA = 'J';
	MIN_COLUMNA = 1;
	MAX_COLUMNA = 10;
	MAR = 'M';
	AGUA = 'A';
	TOCADO = 'T';
 	HUNDIDO = 'H';

TYPE
	TipoRangoFilas: MIN_FILA..MAX_FILA;
	TipoRangoColumnas: MIN_COLUMNA..MAX_COLUMNA;
	TipoTableroJuego: ARRAY [TipoRangoFilas, TipoRangoColumnas] of char;

VAR
{Procedimiento para inicializar el tablero}
PROCEDURE IniMar (VAR tj:TipoTableroJuego;);
	{La variable tiene que pasarse por referencia}
VAR
	{Siempre los indices deben ser declarados como variables locales en las funciones y los procedimientos}
	fila: char;
	columna: integer;
BEGIN
	FOR fila:MIN_FILA TO MAX_FILA DO
	BEGIN
		FOR columna:=MIN_COLUMNA TO MAX_COLUMNA
		BEGIN
			tj[fila][columna]:= MAR;
		END;
	END;
END;
PROCEDURE TocarBarcoRival(fila: char; columna: integer; VAR tj: TipoTableroJuego);
	{comprobar que las cosas están bien}
BEGIN
	
END;



	tablero: TipoTablero;

BEGIN

END;