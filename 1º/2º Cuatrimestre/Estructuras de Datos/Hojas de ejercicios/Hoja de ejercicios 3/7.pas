PROCEDURE CopyTail (tail1: TypeTail; VAR tail2: TypeTail);
VAR
	auxTail:= TypeTail;

BEGIN
	CreateEmptyTail(tail2);
	IF (NOT(EmptyTail(tail2)) THEN
	BEGIN
		auxTail:= tail1^.next;
		WHILE (auxTail <> tail1) DO
		BEGIN
			Insert(tail^.info, tail2);		
			auxTail:= auxTail^.next;
		END;
		Insert(tail^.info, tail2);
	END;
END;