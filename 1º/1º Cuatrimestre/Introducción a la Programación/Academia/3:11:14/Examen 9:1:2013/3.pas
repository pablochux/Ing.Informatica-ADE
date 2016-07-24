{Ejer3. En un equipo de baloncesto hay un grupo de jugadores. EL número máximo de jugadores inscritos es 12, aunque durante la liga se producen altas y bajas, por lo que el número de jugarores reales varía mucho. EL equipo posee unas fichas en las que se almacena información sobre los jugadores. Los datos que se almacenan por cada jugador son la posición. Eñ numero de la camiseta, el nombre y l a altura. El número de la camiseta se utiliza para mantener ordenada la agenda en memoria principal.
Los tipos de datos son los siguientes:
CONST
	N = 9;
	INI = 1;
	FIN = 12;
	MAXPOSICION = 20;
	MAXNOMBRE 25;

TYPE
	TRango = INI..FIN;
	TPosicion = string[MAXPOSICION];
	TNombre = string[MAXPOSICION];
	TJugador = RECORD
		nombre: TNombre;
		posicion: TPosicion;
		numero: Integer;
		altura: real;
	END;
	TFichas = array [TRango] of TJugador;
	TEquipo = RECORD
		fichas: TFichas
		num: Integer;  0 indica que no hay jugadores
	END;
	TFichero = FILE OF TJugador;

}
a) Implemente un subprograma que reciba un nuevo jugador y los incluya en caso de que sea posible al equipo.
FUNCTION ExisteDor (jugador: TJugador; equipo: TEquipo): Boolean;
VAR
	existe: Boolean;
	i, j: Integer;
	mitad: Integer;
BEGIN
	existe:= false;
	i: INI;
	{Se inicializa el tope real del array}
	j: equipo.num;

	WHILE ((NOT existe) AND (i <= j)) DO 
	BEGIN
		mitad:= (i + j) DIV 2;
		existe:= jugador.dorsal = equipo.fichas[mitad].numero;
		IF (NOT existe) THEN
		BEGIN
			IF (jugador.dorsal < equipo.fichas[mitad].dorsal) THEN
			BEGIN
				j:= mitad - 1;
			END
			ELSE
			BEGIN
				i:= mitad + 1;
			END;
		END;
		ExisteD:= existeor
	END;


	END;
END;