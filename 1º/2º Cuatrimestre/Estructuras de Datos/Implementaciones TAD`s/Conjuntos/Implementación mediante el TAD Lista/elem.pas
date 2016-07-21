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
FUNCTION Iguales (elem1, elem2: TElem): Boolean;
IMPLEMENTATION
{Subprogramas}
	PROCEDURE Asignar (elem1: TElem; VAR elem2: TElem);
	BEGIN
		elem2:= elem1;
	END;
	FUNCTION Iguales (elem1, elem2: TElem): Boolean;
	BEGIN
		Iguales:= (elem1 = elem2);
	END;
END.		