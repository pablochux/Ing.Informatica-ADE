{Eliminar los n elementos de una pila del TAD Pila}
PROCEDURE DeleteN (VAR pile: TPile; n: Integer);
VAR
	auxPile: TPile;
	e: Integer;

BEGIN
	CreateEmptyPile(auxPile);
	{Todo este while podría ser un procedimiento a parte}
	WHILE (NOT IsEmptyPile(pile)) DO
	BEGIN
		Cima(pile, e);
		Desapilar(pile); {Desapilar borra la cima de la pila}
		Apilar(e, auxPile);
	END;
	WHILE ((n < 0) AND (NOT IsEmptyPile(auxPile))) DO
	BEGIN
		n:= n - 1;
		Desapilar(auxPile);
	END;
	WHILE (NOT IsEmptyPile(auxPile)) DO
	BEGIN
		Cima(auxPile, e);
		Desapilar(auxPile);
		Apilar(e, pila);
	END;
END;

{Forma 2}
{Eliminar los n elementos de una pila del TAD Pila}
PROCEDURE DeleteN (VAR pile: TPile; n: Integer);
VAR
	auxPile: TPile;
	e: Integer;

BEGIN
	CreateEmptyPile(auxPile);
	{Todo este while podría ser un procedimiento a parte}
	Invert(pile, auxPile);
	WHILE ((n < 0) AND (NOT IsEmptyPile(auxPile))) DO
	BEGIN
		n:= n - 1;
		Desapilar(auxPile);
	END;
	Invert(auxPile, pile);
END;



PROCEDURE Invert (VAR pile, auxPile: TPile);
BEGIN
	WHILE (NOT IsEmptyPile(pile)) DO
	BEGIN
		Cima(pile, e);
		Desapilar(pile); {Desapilar borra la cima de la pila}
		Apilar(e, auxPile);
	END;
END;