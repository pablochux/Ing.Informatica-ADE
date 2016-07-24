PROCEDURE LeerPersona (VAR persona: TipoPersona);
	{El parametro se pasa por referencia ya que se va a modificar el tipo}
	BEGIN
		write('Nombre:');
		readln(persona.nombre);
		write('Apellidos:');
		readln(persona.apellidos);
		write('Edad:');
		readln(persona.edad);
	END;