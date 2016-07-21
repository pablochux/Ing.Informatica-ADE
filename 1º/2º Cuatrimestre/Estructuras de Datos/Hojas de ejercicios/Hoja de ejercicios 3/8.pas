PROCEDURE DestroyTail (VAR tail: TypeTail);
BEGIN
	WHILE (NOT tail = NIL) DO
	BEGIN
		Delete(tail);
	END;
END;