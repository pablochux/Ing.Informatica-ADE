PROGRAM P_TresEnRaya;
{Programa tres en raya}
CONST 
	MIN = 1;
	MAX = 3;
	MAX2 = 5;
TYPE 
	TypeRow = MIN..MAX;
	TypeColumn = MIN..MAX;
	TypePlayer = MIN..MAX2;
	TypeBoardArray = ARRAY [TypeRow, TypeColumn] of char;
VAR
	boardArray: TypeBoardArray;
	playerChar: char;
	finalFinish: Boolean;
	PROCEDURE Center(space: Integer);
	BEGIN
		write(' ':space);
	END;

	PROCEDURE BuildBoard (boardArray: TypeBoardArray);
	{Procedimiento para crear el tablero de juego}
	BEGIN
		writeln();
		Center(20);
		write(boardArray[1][1]:2, '|':2 , boardArray[1][2]:2); 
		writeln('|':2, boardArray[1][3]:2);
		Center(20);
		writeln('-----------');
		Center(20);
		write(boardArray[2][1]:2, '|':2 , boardArray[2][2]:2); 
		writeln('|':2, boardArray[2][3]:2);
		Center(20);
		writeln('-----------');
		Center(20);
		write(boardArray[3][1]:2, '|':2 , boardArray[3][2]:2); 
		writeln('|':2, boardArray[3][3]:2);
		writeln();
		
	END;
	PROCEDURE FillBoard (VAR boardArray: TypeBoardArray);
	{Procedimiento para rellenar el tablero con espacios}
	VAR
		row, column: Integer;
	BEGIN
		FOR row:=MIN TO MAX DO 
		BEGIN
		 	FOR column:=MIN TO MAX DO
		 	BEGIN
		 	 	boardArray[row][column]:=' ';
		 	END; 
		END; 
	END;
	PROCEDURE TurnPlayer (VAR boardArray: TypeBoardArray; playerChar: char);
	{Procedimiento para un turno (se escribe una X o una O en el tablero)}
	VAR
		columnChosen, rowChosen: Integer;
		correctRow, correctColumn: Boolean;
	BEGIN
		correctRow:= false;
		correctColumn:= false;
		{La variable booleana correct sirve para determinar si es correcto la posición que se ha introducido o no}
		{Se pide escribir la fila en la que escribir la ficha y hasta que no sea un número entre 1 y 3}
		REPEAT
		BEGIN
			{Escribir fila}
			Center(5);
			write('Escriba la fila en la que quiere colocar ficha: ');
			readln(rowChosen);
			{Condición, este entre 1 y 3}
			IF (rowChosen >= 1) AND (rowChosen <= 3) THEN
			BEGIN
				correctRow:= true; 
			END
			ELSE
			BEGIN
				Center(20);
				writeln('Posición incorrecta');
			END;
			{Escribir columna}
			{Comprobación de que fila es correcta}
			IF (correctRow) THEN
			BEGIN
				Center(5);
				write('Escriba la columna en la que quiere colocar ficha: ');
				readln(columnChosen);
				{Condición este entre 1 y 3 y este disponible}
				IF (columnChosen >= 1) AND (columnChosen <= 3) AND (boardArray[rowChosen][columnChosen] = ' ') THEN
				BEGIN
					correctColumn:= true; 
				END
				ELSE
				BEGIN
					Center(20);
					writeln('Posición incorrecta');
				END;
			END;
		END;
		UNTIL (correctRow) AND (correctColumn);
		boardArray[rowChosen][columnChosen]:= playerChar;
		BuildBoard(boardArray);
	END;
	PROCEDURE Winner (boardArray: TypeBoardArray; VAR finalFinish: Boolean);
	VAR
		finish: Boolean;
		row, column: Integer;
		cases: Char;

	BEGIN
	{Caso haya ganado X}
	cases:= 'X';
	finish:= false;
	WHILE (NOT finish) DO
	BEGIN

		IF ((boardArray[1][1] = cases) AND (boardArray[1][2] = cases) AND (boardArray[1][3] = cases)) THEN
		BEGIN
			writeln('Han ganado las ', cases);
			finalFinish:= true;
		END
		ELSE IF   ((boardArray[2][1] = cases) AND (boardArray[2][2] = cases) AND (boardArray[3][1] = cases))	THEN
		BEGIN
			writeln('Han ganado las ', cases); 
			finalFinish:= true;
		END
		ELSE IF  	((boardArray[3][1] = cases) AND (boardArray[3][2] = cases) AND (boardArray[3][3] = cases))	THEN
		BEGIN
			writeln('Han ganado las ', cases); 
			finalFinish:= true;
		END
		ELSE IF  	((boardArray[1][1] = cases) AND (boardArray[2][1] = cases) AND (boardArray[3][1] = cases))	THEN
		BEGIN
			writeln('Han ganado las ', cases); 
			finalFinish:= true;
		END
		ELSE IF  	((boardArray[1][2] = cases) AND (boardArray[2][2] = cases) AND (boardArray[3][2] = cases))	THEN
		BEGIN
			writeln('Han ganado las ', cases); 
			finalFinish:= true;
		END
		ELSE IF  	((boardArray[1][3] = cases) AND (boardArray[2][3] = cases) AND (boardArray[3][3] = cases))	THEN
		BEGIN
			writeln('Han ganado las ', cases); 
			finalFinish:= true;
		END
		ELSE IF  	((boardArray[1][1] = cases) AND (boardArray[2][2] = cases) AND (boardArray[3][3] = cases))	THEN
		BEGIN
			writeln('Han ganado las ', cases); 
			finalFinish:= true;
		END
		ELSE IF  	((boardArray[1][3] = cases) AND (boardArray[2][2] = cases) AND (boardArray[3][1] = cases))	THEN
		BEGIN
			writeln('Han ganado las ', cases); 
			finalFinish:= true;
		END;
		IF (cases = 'O') THEN
		BEGIN
			finish:= true;
		END;
		cases:= 'O';
	END;
	
	END;
	PROCEDURE GameTurns(finalFinish: Boolean);
	VAR
		i: Integer;
	BEGIN
		i:= 1;
		WHILE (i <> 9) DO
		BEGIN
			IF (i = 2) OR (i = 4) OR (i=6) OR (i=8) THEN
			BEGIN
				playerChar:= 'X';
			END
			ELSE
			BEGIN
				playerChar:= 'O'; 
			END;
			TurnPlayer(boardArray, playerChar);
			Winner(boardArray, finalFinish);
			i:= i + 1;
			IF (finalFinish) THEN
			BEGIN
				i:= 9;
			END;
		END; 
	END;
BEGIN
	finalFinish:= false;
	FillBoard(boardArray);
	BuildBoard(boardArray);
	GameTurns(finalFinish);
END.