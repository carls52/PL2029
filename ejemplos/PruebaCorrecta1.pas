program ejemploPruebaFunciones;

{declaración de función CON parámetros}
FUNCTION fun1 ( a:INTEGER ; b:REAL ) : INTEGER
BEGIN
  proc2; {llamada de procedimiento}
END;
{declaración de función SIN parámetros}

FUNCTION fun2 : REAL
BEGIN
  proc1(1.3 , -4); {llamada de procedimiento}
END;
{declaración de procedimiento CON parámetros}


PROCEDURE proc1 ( c:REAL ; d:INTEGER )
BEGIN
    valor := fun1(1 , 1.0); {llamada de funcion}
END
{declaración de procedimiento SIN parámetros}


PROCEDURE proc2
BEGIN
    valor := fun2; {llamada de funcion}
END


PROCEDURE main
BEGIN
    proc1;
    proc2;
END.
