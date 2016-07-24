PROGRAM ArrayRecord;
CONST
	MIN = 1;
	MAX = 10;
TYPE
	TFirstName = String [10];
	TLastName = String [20];
	TAge = 1..100;
	TRecord = RECORD 
		FirstName: string;
		LastName: string;
		Age: Integer;
	END;
	TRecordArray = ARRAY [MIN..MAX] of TRecord;
	TMenu = 0..4;

{SUBPROGRAMAS}

	{Subprograma para ir guardando automaticamente los datos}
	PROCEDURE ExportDataAutomated (recordArray: TRecordArray; counterRecordWanted: Integer; VAR backup: Text);
	VAR
		i: Integer;
	BEGIN
		writeln('Exportación automática');
		assign(backup , 'ejemplo.txt');
		{Poner IORESULT?}
		append(backup);
		FOR i:=MIN TO counterRecordWanted DO
		BEGIN
			writeln();
		 	writeln(backup, 'Registro ' , i , ' de ', counterRecordWanted);
		 	writeln(backup, 'Nombre: ', recordArray[i].FirstName);
		 	writeln(backup, 'Apellido: ', recordArray[i].LastName);
		 	writeln(backup, 'Edad: ', recordArray[i].Age);
		 	writeln(backup);
		END;
		close(backup);
	END;

	{Subprograma para centrar}
	PROCEDURE Center (num: Integer);
	BEGIN
		write(' ':num);
	END;
	{Subprograma para rellenar un registro}
	PROCEDURE FillRecord (VAR recordArray: TRecordArray; numRecordWanted: Integer; VAR counterRecordWanted: Integer);
	VAR
		counter: Integer;
	BEGIN
		FOR counter:=counterRecordWanted+1 TO (numRecordWanted+counterRecordWanted) DO
		BEGIN
			center(20);
			writeln('Registro nº', counter, ' de ', counterRecordWanted + numRecordWanted);
			center(20);
			write('Escribe el nombre: ');
			readln(recordArray[counter].FirstName);
			center(20);
			write('Escribe el apellido: ');
			readln(recordArray[counter].LastName);
			center(20);
			write('Escribe la edad: ');
			readln(recordArray[counter].Age);
			{Error si se introducen datos que no son números}
			writeln();
		END;
		{Se incrementa la variable counterRecordWanted en numRecordWanted, que son los nuevos registros que se han introducido}
		counterRecordWanted:= counterRecordWanted + numRecordWanted;
	END;
	{Subprograma para saber cuantos registros se quieren rellenar}
	PROCEDURE NumRecord (VAR numRecordWanted: Integer; VAR recordArray: TRecordArray; VAR counterRecordWanted: Integer);
	BEGIN
		writeln('Nuevo Registro');
		writeln();
		writeln('Hay ', counterRecordWanted, ' registros en la base de datos');
		writeln();
		Center(20);
		writeln('¿Cuantos registros quieres rellenar?');
		Center(30);
		readln(numRecordWanted);
		writeln;
		FillRecord(recordArray, numRecordWanted, counterRecordWanted);
	END;

	{Subprograma para mostrar los registros}
	PROCEDURE DisplayRecord (VAR recordArray: TRecordArray; counterRecordWanted: Integer; VAR backup: Text);
	VAR
		counter: Integer;
	BEGIN
			writeln();
			writeln();
			center(15);
			writeln('Mostrar registro');
			writeln('Hay ', counterRecordWanted, ' registros en la base de datos');
		FOR counter:=MIN TO counterRecordWanted DO
		BEGIN
			Center(20);
			write('Nombre: ');
			writeln(recordArray[counter].FirstName);
			Center(20);
			write('Apellido: ');
			writeln(recordArray[counter].LastName);
			Center(20);
			write('Edad: ');
			writeln(recordArray[counter].Age);
			writeln();
		END;
		ExportDataAutomated(recordArray, counterRecordWanted, backup);
	END;

	{Subprograma para mostrar el menú}
	PROCEDURE DisplayMenu (recordFilled:Boolean);
	BEGIN
		writeln;
		center(10);
		writeln('¿Que quieres hacer con el registro?');
		Center(20);
		writeln('Pulsa');
		Center(20);
		writeln('1 para Nuevo Registro');
		center(20);
		writeln('2 para Importar Datos');
		{Mientras no se hayan rellenado registros no se podrá Ordenar o Mostrar}
		IF (recordFilled) THEN
		BEGIN
			Center(20);
			writeln('3 para Mostrar');
			Center(20);
			writeln('4 para Ordenar');
			Center(20);
			writeln('5 para Exportar');
		END;
	END;

	{Procedimiento para ordenar los elementos de la base de datos por el nombre}
	PROCEDURE SortByName (VAR recordArray: TRecordArray; counterRecordWanted: Integer; optionSortMenu: Integer; VAR backup: Text);
	VAR
		i, j: Integer;
		aux: TRecord;
	BEGIN
		IF (optionSortMenu = 1) THEN 
		BEGIN
			{Ordenación por nombre de A a la Z}
			FOR i:=counterRecordWanted DOWNTO (MIN + 1) DO
			BEGIN
			 	FOR j:=MIN TO (i-1)  DO
			 	BEGIN
			 		IF (recordArray[j].FirstName > recordArray[j+1].FirstName) THEN
			 		BEGIN
			 			aux:= recordArray[j+1];
			 			recordArray[j+1]:= recordArray[j];
			 			recordArray[j]:= aux;
			 		END;
			 	END;
			END;
		END
		ELSE 
		BEGIN
			{Ordenación por nombre de Z a A}
			FOR i:=counterRecordWanted DOWNTO (MIN + 1) DO
			BEGIN
			 	FOR j:=MIN TO (i-1)  DO
			 	BEGIN
			 		IF (recordArray[j].FirstName < recordArray[j+1].FirstName) THEN
			 		BEGIN
			 			aux:= recordArray[j+1];
			 			recordArray[j+1]:= recordArray[j];
			 			recordArray[j]:= aux;
			 		END;
			 	END;
			END;
		END;
		DisplayRecord(recordArray, counterRecordWanted, backup);
	END;

	{Procedimiento para ordenar los elementos de la base de datos por el apellido}
	PROCEDURE SortByLastName (VAR recordArray: TRecordArray; counterRecordWanted: Integer; optionSortMenu: Integer; VAR backup: Text);
	VAR
		i, j: Integer;
		aux: TRecord;
	BEGIN
		IF (optionSortMenu = 1) THEN 
		BEGIN
			{Ordenación por nombre de A a la Z}
			FOR i:=counterRecordWanted DOWNTO (MIN + 1) DO
			BEGIN
			 	FOR j:=MIN TO (i-1)  DO
			 	BEGIN
			 		IF (recordArray[j].LastName > recordArray[j+1].LastName) THEN
			 		BEGIN
			 			aux:= recordArray[j+1];
			 			recordArray[j+1]:= recordArray[j];
			 			recordArray[j]:= aux;
			 		END;
			 	END;
			END;
		END
		ELSE 
		BEGIN
			{Ordenación por nombre de Z a A}
			FOR i:=counterRecordWanted DOWNTO (MIN + 1) DO
			BEGIN
			 	FOR j:=MIN TO (i-1)  DO
			 	BEGIN
			 		IF (recordArray[j].LastName < recordArray[j+1].LastName) THEN
			 		BEGIN
			 			aux:= recordArray[j+1];
			 			recordArray[j+1]:= recordArray[j];
			 			recordArray[j]:= aux;
			 		END;
			 	END;
			END;
		END;
		DisplayRecord(recordArray, counterRecordWanted, backup);
	END;

	{Procedimiento para ordenar los elementos de la base de datos por la edad}
	PROCEDURE SortByAge (VAR recordArray: TRecordArray; counterRecordWanted: Integer; optionSortMenu: Integer; VAR backup: Text);
	VAR
		i, j: Integer;
		aux: TRecord;
	BEGIN
		IF (optionSortMenu = 1) THEN 
		BEGIN
			{Ordenación por nombre de A a la Z}
			FOR i:=counterRecordWanted DOWNTO (MIN + 1) DO
			BEGIN
			 	FOR j:=MIN TO (i-1)  DO
			 	BEGIN
			 		IF (recordArray[j].Age < recordArray[j+1].Age) THEN
			 		BEGIN
			 			aux:= recordArray[j+1];
			 			recordArray[j+1]:= recordArray[j];
			 			recordArray[j]:= aux;
			 		END;
			 	END;
			END;
		END
		ELSE 
		BEGIN
			{Ordenación por nombre de Z a A}
			FOR i:=counterRecordWanted DOWNTO (MIN + 1) DO
			BEGIN
			 	FOR j:=MIN TO (i-1)  DO
			 	BEGIN
			 		IF (recordArray[j].Age > recordArray[j+1].Age) THEN
			 		BEGIN
			 			aux:= recordArray[j+1];
			 			recordArray[j+1]:= recordArray[j];
			 			recordArray[j]:= aux;
			 		END;
			 	END;
			END;
		END;
		DisplayRecord(recordArray, counterRecordWanted, backup);
	END;

	{Programa para mostrar el menu de ordenación}
	PROCEDURE DisplaySortMenu (VAR recordArray: TRecordArray; counterRecordWanted: Integer; VAR optionSortMenu: TMenu; VAR backup: Text);
	BEGIN
		REPEAT 
			writeln('¿Cómo quieres ordenar la base de datos?');
			writeln('Pulsa');
			writeln('1 para ordenar por Nombre');
			writeln('2 para ordenar por Apellido');
			writeln('3 para ordenar por Edad');
			readln(optionSortMenu);
		UNTIL (optionSortMenu = 1) OR (optionSortMenu = 2) OR (optionSortMenu = 3);
		CASE (optionSortMenu) OF
			1:
			BEGIN
				writeln('Pulsa');
				writeln('1 para ordenar por Nombre de la A a la Z');
				writeln('2 para ordenar por Nombre de la Z a la A');
				readln(optionSortMenu);
				SortByName(recordArray, counterRecordWanted, optionSortMenu, backup);
			END;
			2:
			BEGIN
				writeln('Pulsa');
				writeln('1 para ordenar por Apellido de la A a la Z');
				writeln('2 para ordenar por Apellido de la A a la Z');
				readln(optionSortMenu);
				SortByLastName(recordArray, counterRecordWanted, optionSortMenu, backup);
			END;
			3:
			BEGIN
				writeln('Pulsa');
				writeln('1 para ordenar por Edad de mayor a menor');
				writeln('2 para ordenar por Edad de menor a mayor');
				readln(optionSortMenu);
				SortByAge(recordArray, counterRecordWanted, optionSortMenu, backup);
			END;
		END;
	END;

	{Procedimiento para importar los datos de la base de datos de una fuente externa}
	{Error de bucle infinito, además me pide que escriba algo ???????}
	PROCEDURE ImportData (VAR recordArray: TRecordArray; counterRecordWanted: Integer; VAR backup: Text);
	VAR
		backupName: String;
		c: Char;
		counter: Integer;
		auxCounter: Integer;
		field:String;
		num: Integer;
	BEGIN
		auxCounter:=0;
		field:= ' ';
				 				writeln('Prueba antes de asingar la variable');

		assign(backup, 'ejemplo.txt');
						 		writeln('Prueba antes del reset');

		{$I-}
		reset(backup);
		{$I+}
						 		writeln('Prueba después del reset');

		IF (IOresult = 0) THEN
		BEGIN
		
			 				writeln('Prueba dentro del IOresult');

		 	WHILE (NOT EOF(backup))  DO
		 	BEGIN
		 						writeln('Prueba dentro del while');
		 		readln(backup, c);
		 		IF (c = ':') THEN
		 		BEGIN
		 				 		writeln('Prueba dentro del primer IF');

		 		 	auxCounter:= auxCounter + 1;
		 		END
		 		ELSE IF (c = ':') THEN 
		 		BEGIN
		 				 		writeln('Prueba dentro del segundo IF');

		 			auxCounter:= auxCounter + 1;
		 		END;
		 		IF (auxCounter = 2) THEN
		 		BEGIN
		 				 		writeln('Prueba dentro del tercer IF !!!!!');

		 			REPEAT 
		 		 	readln(backup, c);
		 		 	field:= field + c;
		 		 	UNTIL (c = ' ');
		 		 	auxCounter:= 0;
		 		 	writeln(field);
		 		END;
		 	 	IF (EOLN) THEN
		 	 	BEGIN
		 	 			 		writeln('Prueba dentro del IF del salto de línea');

		 	 	 	readln(backup);
		 	 	END;
		 	END;
		END 
		ELSE
		BEGIN
		 	writeln('Ha habido un problema con la importación del archivo.'); 	
		END;
		close(backup);
	END;

	{Procedimiento para mostrar la informaicón antes de importar los datos de un archivo externo}
	PROCEDURE ImportDataInfo (VAR recordArray: TRecordArray; numRecordWanted: Integer; VAR backup: Text);
	VAR
		answer: String;
	BEGIN
		writeln('El formato de los datos debe ser el siguiente: ');
		writeln();
		writeln('Nombre: ');
		writeln('Apellido: ');
		writeln('Edad: ');
		writeln();
		writeln('¿Quieres continuar?');
		readln(answer);
		IF (answer = 'si') OR (answer = 'Si') OR (answer = 'SI') THEN
		BEGIN
		 	ImportData(recordArray, numRecordWanted, backup);
		END;
	END;
	
	{Procedimiento para exportar los datos de la base de datos}
	PROCEDURE ExportData (recordArray: TRecordArray; counterRecordWanted: Integer; VAR backup: Text);
	VAR
		i: Integer;
	BEGIN
		writeln('Exportar');
		assign(backup , 'copia.txt');
		rewrite(backup);
		FOR i:=MIN TO counterRecordWanted DO
		BEGIN
		 	writeln(backup, 'Registro ' , i , ' de ', counterRecordWanted);
		 	writeln(backup, 'Nombre: ', recordArray[i].FirstName);
		 	writeln(backup, 'Apellido: ', recordArray[i].LastName);
		 	writeln(backup, 'Edad: ', recordArray[i].Age);
		 	writeln(backup);
		END;
		close(backup);
	END;

	{Crear registro de ejemplo}
	PROCEDURE CreateExampleRecord (VAR recordArray: TRecordArray; VAR counterRecordWanted: Integer; VAR recordfilled: Boolean);
	BEGIN
		recordfilled:= true;
		counterRecordWanted:= 3;
		recordArray[1].FirstName:= 'Alfonso';
		recordArray[1].LastName:= 'Alonso';
		recordArray[1].Age:= 45;
		recordArray[2].FirstName:= 'Bernardo';
		recordArray[2].LastName:= 'Bernandez';
		recordArray[2].Age:= 89;
		recordArray[3].FirstName:= 'Celia';
		recordArray[3].LastName:= 'Celiaco';
		recordArray[3].Age:= 14;
	END;
VAR
	{Registro}
	myRecord: TRecord;
	{Array con los registros}
	recordArray: TRecordArray;
	{Numero de registros que se quieren rellenar}
	numRecordWanted: Integer;
	{Contador de los registros que se llevan}
	counterRecordWanted: Integer;
	{Opción elegida en el menú}
	optionMenu: TMenu;
	{Registros rellenados}
	recordFilled: Boolean;
	{Booleano para señalizar el final del programa}
	done: Boolean;
	{Opción elegida dentro del menú Ordenar}
	optionSortMenu: TMenu;
	{Variable para archivo de texto}
	backup: Text;

{Programa principal}
BEGIN
	counterRecordWanted:= 0;
	recordFilled:= false;
	done:= false; 		
	REPEAT
		REPEAT
			{Se muestra el menú}
			DisplayMenu(recordfilled);
			{Se lee la opción del menu que se quiere}
			Center(20);
			readln(optionMenu);
		UNTIL (optionMenu = 0) OR (optionMenu = 1) OR (optionMenu = 2) OR (optionMenu = 3) OR (optionMenu = 4) OR (optionMenu = 5);
		{Caso para rellenar registro automáticamente}
		IF (optionMenu = 0) THEN
		BEGIN
		 	CreateExampleRecord(recordArray, counterRecordWanted, recordfilled);
		END;
		{Si no hay ningún registro, solo se muestra la opción 1. Nuevo archivo)}
		IF (optionMenu = 1) THEN
		BEGIN
			Center(15);
			NumRecord(numRecordWanted, recordArray, counterRecordWanted);
			recordFilled:= true;
		END
		ELSE IF (optionMenu = 2) THEN 
		BEGIN
			ImportDataInfo(recordArray, numRecordWanted, backup);
		END;
		{Cuando se haya rellenado un archivo se muestran el resto de opciones}
		IF (recordFilled) THEN
		BEGIN
		 	CASE optionMenu of
			 	3:
			 	BEGIN
			 	 	DisplayRecord(recordArray, counterRecordWanted, backup);
			 	END;
			 	4:
			 	BEGIN
			 		DisplaySortMenu(recordArray, counterRecordWanted, optionSortMenu, backup);
			 	END;
			 	5:
			 	BEGIN
			 	 	ExportData(recordArray, counterRecordWanted, backup);
			 	END;
			END;
		END;
	UNTIL (done);
END.