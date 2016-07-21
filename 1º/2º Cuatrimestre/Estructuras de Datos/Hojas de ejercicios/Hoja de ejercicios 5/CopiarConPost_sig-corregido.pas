PROCEDURE Copiar(VAR destino:TipoListaEspecial; origen:TipoListaEspecial);
VAR
     pAux:TipoListaEspecial;
     
BEGIN
     destino:=NIL;
     IF (origen<>NIL) THEN BEGIN
         WHILE (origen<>NIL) DO BEGIN
             InsertarFinal(origen^.info,destino);
             origen:=origen^.sig;
         END;
         pAux:=destino;
         WHILE (pAux^.sig<>NIL) DO BEGIN
             pAux^.posterior_siguiente:=pAux^.sig^.sig;
             pAux:=pAux^.sig;
         END;
         pAux^.posterior_siguiente:=NIL;
     END;
END;