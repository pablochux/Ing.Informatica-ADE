{**************************************************************************
* Modulo: TAD ELem                  									  *
* Tipo: Programa(x) Interfaz-Implementacion TAD Elem()         			  *
* Autor: Pablo Alonso                                                     *
* Fecha: 2015                                                             *
* Descripcion: Implementación del TAD Elem  							  *
***************************************************************************}
UNIT Elem;
INTERFACE
	TYPE
		TElem = Integer;
	
	{Cabeceras Subprogramas}
	PROCEDURE Asignar (elem1: TElem; VAR elem2: TElem);
	{Asigna el valor de elem1 a elem2}
	FUNCTION Iguales (elem1, elem2: TElem): Boolean;
	{Devuelve el resultado de comparar elem1 y elem2}
IMPLEMENTATION
	{Subprogramas}
	PROCEDURE Asignar (elem1: TElem; VAR elem2: TElem); {O(1)}
	BEGIN
		elem2:= elem1;
	END;
	FUNCTION Iguales (elem1, elem2: TElem): Boolean; {O(1)}
	BEGIN
		Iguales:= (elem1 = elem2);
	END;
END.		