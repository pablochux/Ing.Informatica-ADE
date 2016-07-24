PROGRAM readTextFile;
VAR
	myFile: Text;
	{se degine myFile como text ya que el archivo que leeremos será un TXT}
	c: Char;
BEGIN
	assign(myFile, 'mevameva.txt');
	{Se asigna el archivo mevameva.txt a la variable myFile, por lo que cada vez que queramos referirnos a mevameva.txt lo haremos mediante myFile}
	{$I-} {desactiva el control de interrupciones}
	reset(myFile);
	{abre el fichero en modo lectura y si no existe peta, por eso se desactiva el control de interrupciones}
	{$I+} {activa el control de interrupciones}
	IF (IOResult = 0) THEN
	{IOResult devuelve el resultado de la operación entrada-salida (input-output)}
	{Si IOResult es = 0 es que no hay errores}
	BEGIN
		{Mientas no sea el final del fichero}
		WHILE (NOT eof(myFile)) DO
		{eof es un tipo predefinido en pascal que es el final del archivo (end of file) se le pasa como parametro myFile que es nuestro archivo txt}
		BEGIN
			{Si se llega al final de la línea}
			IF (eoln(myFile)) THEN
			{eoln es un tipo predefinido que es el final de la línea (end of line) se le pasa por parametro myFile que es nuestro archivo txt}
			BEGIN
				readln(myFile);
				writeln; 
			END
			{Primero se entra por aquí, se lee el primer caracter}
			ELSE
			BEGIN
				read(myFile, c);
				write(c); 
			END;
		END;
		{cierras el archivo, cuando se quiere utilizar ficheros lo que se hace es abrirlo leerlo o escribirlo y cerrarlo}
		close(myFile);
	END;
END.