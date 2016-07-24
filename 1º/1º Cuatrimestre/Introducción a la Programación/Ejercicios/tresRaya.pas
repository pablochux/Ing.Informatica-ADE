PROGRAM tres_en_raya;

TYPE
  TTablero = ARRAY [1..3,1..3] OF char;
  
PROCEDURE crear_tablero_vacio(VAR t: TTablero);
VAR
  fila,columna: integer;
BEGIN
  FOR fila:= 1 TO 3 DO
    FOR columna:= 1 TO 3 DO
	  t[fila,columna] := ' ';
END;  
  
PROCEDURE dibujar_tablero(t: TTablero);
VAR
  fila,columna: integer; 
BEGIN
  writeln;
  FOR fila:=1 TO 2 DO
  BEGIN
    FOR columna:=1 TO 2 DO
	  write(' ',t[fila,columna],' |');
	  
	writeln(' ',t[fila,3],' ');
    writeln('-----------');
  END;

  FOR columna:=1 TO 2 DO
	write(' ',t[3,columna],' |');
	  
  writeln(' ',t[3,3],' ');
  writeln;
END;
  
PROCEDURE introducir_nueva_ficha(VAR t: TTablero; jugador: integer);
VAR
  fila,columna: integer;
BEGIN

  REPEAT
    write('Introduce la fila: ');
    readln(fila);
    write('Introduce la columna: ');
    readln(columna);
	
	IF (fila<1) OR (fila>3) OR (columna<1) OR (columna>3) THEN
	  writeln('Celda no valida')
	ELSE IF t[fila,columna]<>' ' THEN
	  writeln('Celda ocupada');

  UNTIL (fila>=1) AND (fila<=3) AND (columna>=1) AND (columna<=3) AND (t[fila,columna]=' ');
	
  IF jugador=1 THEN
    t[fila,columna] := 'X'
  ELSE
    t[fila,columna] := 'O';
	
END;  
  
FUNCTION existe_ganador(t: TTablero):boolean;
VAR
  i: integer;
  hay_ganador: boolean;
BEGIN

  hay_ganador := FALSE;
  i := 1;
  WHILE not hay_ganador AND (i<=3) DO
  BEGIN
    hay_ganador := ((t[i,1]=t[i,2]) AND (t[i,1]=t[i,3]) AND (t[i,1]<>' '));
    i:=i+1;
  END;

  i := 1;
  WHILE not hay_ganador AND (i<=3) DO
  BEGIN
    hay_ganador := ((t[1,i]=t[2,i]) AND (t[1,i]=t[3,i]) AND (t[1,i]<>' '));
    i:=i+1;
  END;

  IF not hay_ganador THEN
    hay_ganador := ((t[1,1]=t[2,2]) AND (t[1,1]=t[3,3]) AND (t[1,1]<>' '))
              OR ((t[1,3]=t[2,2]) AND (t[1,3]=t[3,1]) AND (t[1,3]<>' '));

  existe_ganador := hay_ganador;
END;
  

  
VAR
  tablero: TTablero;  
  turno,jugador: integer;
  hay_ganador: boolean;
  
BEGIN

  crear_tablero_vacio(tablero);
  dibujar_tablero(tablero);

  turno := 1;
  hay_ganador := FALSE;
  REPEAT
    IF odd(turno) THEN
	  jugador:=1
	ELSE
      jugador:=2;

    introducir_nueva_ficha(tablero,jugador);
	dibujar_tablero(tablero);
  
    IF turno>=5 THEN 
      hay_ganador := existe_ganador(tablero);
  
    turno := turno+1;
  UNTIL hay_ganador OR (turno>9);
  
  IF hay_ganador THEN
    writeln('Ha ganado el jugador ',jugador)
  ELSE
    writeln('Los jugadores han empatado');
  
  readln;
END.  