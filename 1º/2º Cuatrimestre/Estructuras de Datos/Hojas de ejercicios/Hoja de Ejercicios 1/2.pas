FUNCTION CompareNumbers (number1, number2: Integer):Boolean;
BEGIN
	CompareNumbers:= (number1 = number2);
END;

FUNCTION CountReps (list: TypeList; number: Integer): Integer;
VAR
	auxList: TypeList; {Como la lista se pasa por valor, se puede omitir la lista auxiliar y reocrrer la lista directamente con el puntero lista}
	counter: Integer;

BEGIN
	auxList:= list; {auxList es el puntero auxiliar de list}
	counter:= 0; {contador empieza siendo 0}
	WHILE (auxList <> NIL) DO {Mientras no se llegue al final de la lista}
	BEGIN
		IF (CompareNumbers(number, auxList^.info)) THEN {Si el número que hay en el nodo es el mismo que number}
		BEGIN
			counter:= counter + 1; {En el caso que sean los mismos, se aumenta en uno el contador}
		END;
		auxList:= auxList^.next; {Sea o no el dato igual, se va recorriendo la posición}
	END;
	CountReps:= counter; {Se asigna el valor del contador a la función}
END;
