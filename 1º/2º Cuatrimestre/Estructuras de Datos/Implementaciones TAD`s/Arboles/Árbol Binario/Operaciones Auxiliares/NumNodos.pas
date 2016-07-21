FUNCTION  Length(binaryThree: TypeBinaryThree): Integer;
	VAR
		leftSon, rightSon: TypeBinaryThree;

	BEGIN
		IF (IsEmpty(binaryThree)) THEN
		BEGIN
			Length:= 0;
		END
		ELSE 
		BEGIN
			GiveLeftSon(binaryThree, leftSon);
			GiveRightSon(binaryThree, rightSon);
			Length:= 1 + Length(leftSon) + Length(rightSon);
		END;
	END;