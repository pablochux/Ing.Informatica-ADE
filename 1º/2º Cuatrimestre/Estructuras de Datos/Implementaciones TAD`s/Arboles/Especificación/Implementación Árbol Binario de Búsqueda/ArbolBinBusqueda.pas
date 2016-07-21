{Implementación del TAD Arbol Binario de Búsqueda}
UNIT ArbolBin;
INTERFACE
	USES elem; 
	TYPE
		TipoArbolBinBus = ^TipoNodo;
		TipoNodo = RECORD
			info: TipoElemento;
			hi, hd: TipoArbolBinBus;
		END;
	{Cabeceras Subprogramas}
	PROCEDURE CrearArbolBinVacio (VAR arbol: TipoArbolBinBus);
	PROCEDURE Construir (r: TipoElemento; hi, hd: TipoArbolBinBus; VAR arbol: TipoArbolBinBus);
	PROCEDURE HijoIzq (arbol: TipoArbolBinBus; VAR hi: TipoArbolBinBus);
	PROCEDURE HijoDer (arbol: TipoArbolBinBus; VAR hd: TipoArbolBinBus);
	PROCEDURE Raiz (arbol: TipoArbolBinBus; VAR r: TipoElemento);
	FUNCTION EsArbolBinVacio (arbol: TipoArbolBinBus): Boolean;
	PROCEDURE Insertar (e: TipoElemento; VAR arbol: TipoArbolBinBus);
	PROCEDURE Eliminar (e: TipoElemento; VAR arbol: TipoArbolBinBus);
	FUNCTION Pertenece (e: TipoElemento; arbol TipoArbolBinBus): Boolean;


IMPLEMENTATION
	{Subprogramas}
	PROCEDURE CrearArbolBinVacio (VAR arbol: TipoArbolBinBus);
	PROCEDURE Construir (r: TipoElemento; hi, hd: TipoArbolBinBus; VAR arbol: TipoArbolBinBus);
	PROCEDURE HijoIzq (arbol: TipoArbolBinBus; VAR hi: TipoArbolBinBus);
	PROCEDURE HijoDer (arbol: TipoArbolBinBus; VAR hd: TipoArbolBinBus);
	PROCEDURE Raiz (arbol: TipoArbolBinBus; VAR r: TipoElemento);
	FUNCTION EsArbolBinVacio (arbol: TipoArbolBinBus): Boolean;
	PROCEDURE Insertar (e: TipoElemento; VAR arbol: TipoArbolBinBus);
	VAR
		aVacio, r, hi, hd: TipoArbolBinBus;


	BEGIN
		IF (EsArbolBinVacio(arbol)) THEN {Si el arbol es vacio, se inserta como raiz}
		BEGIN
			CrearArbolBinVacio(aVacio); {Creo un arbol vacio}
			Construir(e, aVacio, aVacio, arbol); 
		END
		ELSE 
		BEGIN
			{Siempre se despedaza el árbol}
			Raiz(arbol, r);
			HijoIzq(arbol, hi);
			HijoDer(arbol, hd);
			IF (Mayor(e, R)) THEN 
			BEGIN
				Insertar(e, arbol^.hd); {No podría ser hd o hi porque son variables locales, por lo que no sé}
			END
			ELSE 
			BEGIN
				Insertar(e, arbol^.hi);
			END;
		END;
	END;

	PROCEDURE Eliminar (e: TipoElemento; VAR arbol: TipoArbolBinBus); {Se hace el mayor de los menores y el menor de los mayores, porque siempre es un caso base}
	VAR
		m, pAux, r, hi, hd: TipoArbolBinBus;

	BEGIN {Eliminar un nodo que no tiene hijos o el que tiene un hijo, caso recursivo es el que tiene dos}
		IF (NOT EsArbolBinVacio(lista)) THEN 
		BEGIN
			Raiz(arbol, r);
			HijoIzq(arbol, hi);
			HijoDer(arbol, hd);
			IF (Iguales(r, e)) THEN 
			BEGIN
				IF (EsArbolBinVacio(hi)) THEN 
				BEGIN
					pAux:= arbol;
					arbol:= arbo^.hd;
					DISPOSE(pAux);
				END
				ELSE IF (EsArbolBinVacio(hd)) THEN 
				BEGIN
					pAux:= arbol;
					arbol:= arbol^.hi;
					DIPOSE(pAux);
				END
				ELSE 
				BEGIN
					Minimo(arbol^.hd, m);
					CopiarElemento(m, arbol^.info);
					Eliminar(m, arbol^.hd);
				END;
			END;
			ELSE IF (Mayor(e, r)) THEN 
			BEGIN
				Eliminar(e, arbol^.hd);
			END;
			ELSE 
			BEGIN
				Eliminar(e, arbol^.hi);
			END;
		END;
	END;

	{Procedure Minimo}
	PROCEDURE Minimo (arbol: TipoArbolBinBus; VAR m: TipoElemento);
	VAR 
		r: TipoElemento;
		hi: TipoArbolBinBus;
		
	BEGIN
		IF (NOT EsArbolBinVacio(arbol)) THEN 
		BEGIN
			Raiz(arbol, R);
			HijoIzq(arbol, hi);
			IF (EsArbolBinVacio(hi)) THEN 
			BEGIN
				CopiarElemento(r, m);
			END
			ELSE 
			BEGIN
				Minimo(hi, m);
			END;
		END;
	END;

	FUNCTION Pertenece (e: TipoElemento; arbol TipoArbolBinBus): Boolean;
	VAR
		hd, hi, r: TipoArbolBinBus;

	BEGIN
		IF (EsArbolBinVacio(arbol)) THEN 
		BEGIN
			Pertenece:= FALSE;
		END
		ELSE 
		BEGIN
			Raiz(arbol, r);
			HijoIzq(arbol, hi);
			HijoDer(arbol, hd);
			IF (Iguales(e, r)) THEN 
			BEGIN
				Pertenece:= TRUE;
			END
			ELSE IF (Mayor(e, R)) THEN
			BEGIN
				Pertenece:= Pertenece(e, hd);
			END
			ELSE 
			BEGIN
				Pertenece:= Pertenece(e, hi);
			END;
		END;
	END;
END.		