{**************************************************************************
* Modulo: TAD ELem                  									  *
* Tipo: Programa(x) Interfaz-Implementacion TAD Elem()         			  *
* Autor: Pablo Alonso                                                     *
* Fecha: 2015                                                             *
* Descripcion: Implementación del TAD Elem  							  *
***************************************************************************}
UNIT TADElem;
INTERFACE
	TYPE
		TipoElemento = Integer;
	
	{Cabeceras Subprogramas}
	PROCEDURE Asignar (elem1: TipoElemento; VAR elem2: TipoElemento);
	{Asigna el valor de elem1 a elem2}
	FUNCTION Iguales (elem1, elem2: TipoElemento): Boolean;
	{Devuelve el resultado de comparar elem1 y elem2}
IMPLEMENTATION
	{Subprogramas}
	PROCEDURE Asignar (elem1: TipoElemento; VAR elem2: TipoElemento); {O(1)}
	BEGIN
		elem2:= elem1;
	END;
	FUNCTION Iguales (elem1, elem2: TipoElemento): Boolean; {O(1)}
	BEGIN
		Iguales:= (elem1 = elem2);
	END;
END.		