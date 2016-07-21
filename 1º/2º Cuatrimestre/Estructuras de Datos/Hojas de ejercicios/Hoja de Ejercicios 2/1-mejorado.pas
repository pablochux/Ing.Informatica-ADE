{Truco, hacer como si tuvieras el TAD lista, y luego crear los procedimientos pertinentes}
PROCEDURE DeleteAllApears (element: TypeElement; VAR list: TypeList);
BEGIN
	WHILE (Pertenece(element, list)) DO
	BEGIN
		BorrarElemento(element, list);
	END;
END;