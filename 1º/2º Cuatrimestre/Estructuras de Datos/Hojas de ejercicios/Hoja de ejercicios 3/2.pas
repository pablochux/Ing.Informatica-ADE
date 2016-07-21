PROCEDURE Insert (element: TypeElement; VAR tail: TypeTail);
VAR
	auxTail: TypeTail;

BEGIN
	new(auxTail);
	auxTail^.info:= element; {Because we are in the TAD, we can do operations like :=. }
	{It would be also correct Copy(auxTail^.info, element);}
	IF (tail = NIL) THEN {It´s the same case here. We can use tail = NIL or IsEmpty(tail)}
	BEGIN
		auxTail^.next:= auxTail;
	END
	ELSE 
	BEGIN
		auxTail^.next:= tail^.next; {With tail^.next we access the first element}
		tail^.next:= auxTail;
	END;
	tail:= auxTail;
END;