{Borrar posiciones pares de una lista simplemente enlazada}
PROCEDURE BorrarPosicionesPares (VAR lista: TLista);
VAR
	contador: Integer;
	auxPuntero, auxPunteroPrev: TLista;

BEGIN
	contador:= 1;
	{Punteros auxiliares con punteroAuxiliarAnterior}
	auxPunteroPrev:= NIL;
	auxPuntero:= lista;
	WHILE (auxPuntero <> NIL) DO
	BEGIN
		{contador MOD 2 = 0 significa que la posición en la que estamos es par. Si es par se elimina}
		IF (contador MOD 2 = 0) THEN 
		BEGIN
			{Proceo de eliminación del nodo}
			auxPunteroPrev^.sig:= auxPuntero^.sig;
			DISPOSE(auxPuntero);
			{Se inicializa auxPuntero en el sig nodo que estaba, es decir, el siguiente del nodo eliminado. Para que siga buscando la lista y eliminando}
			auxPuntero:= auxPunteroPrev^.sig;
		END
		{Si la posición es impar, se avanzan los punteros}
		ELSE 
		BEGIN
			auxPunteroPrev:= auxPuntero;
			auxPuntero:= auxPuntero^.sig;
		END;
		{Sea par o impar, se incremente el contador de posiciones}
		contador:= contador + 1;
	END;
END;