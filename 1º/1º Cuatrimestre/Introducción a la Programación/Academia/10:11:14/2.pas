{Registro con minimo y máximo}
PROGRAM programRegistro;
CONST
	MIN = 1;
	MAX = 100;
TYPE
	TipoPersona = RECORD
		nombre: string;
		apellido: string;
		edad: Integer;
	END;
	TipoRangoPersona = MIN..MAX;
	TipoPersonas = ARRAY [TipoRangoPersona] of TipoPersona;
	{Array de registros de personas. Cada caja del array tiene, nombre, apellidos y edad.}
	TipoColegio = RECORD 
		personas: TipoPersonas;
		total: Integer;
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