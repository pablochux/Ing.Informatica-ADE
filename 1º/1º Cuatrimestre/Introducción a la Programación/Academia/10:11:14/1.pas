PROGRAM hola;
TYPE
	TipoPersona = RECORD
		nombre: string;
		apellido: string;
		edad: Integer;
	END;
VAR
	persona: TipoPersona;
	PROCEDURE LeerPersona (VAR persona: TipoPersona);
	{El parametro se pasa por referencia ya que se va a modificar el tipo}
	BEGIN
		write('Nombre: ');
		readln(persona.nombre);
		write('Apellidos: ');
		readln(persona.apellido);
		write('Edad: ');
		readln(persona.edad);
	END;
	PROCEDURE MostrarPersona (VAR persona: TipoPersona);
	{El parametro se pasa por referencia ya que se va a modificar el tipo}
	BEGIN
		writeln(persona.nombre, ' ', persona.apellido, ' , ', persona.edad);
	END;


BEGIN
	LeerPersona(persona);
	MostrarPersona(persona);
END.