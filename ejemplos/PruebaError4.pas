program ejemplo4;

VAR
    a:REAL;
    b:INTEGER;
    c:REAL;
BEGIN
    a:= 1.0;
    b:= 1.0;
    c:= 3.0;
    while a = b do
    BEGIN
        b := c;
    END

END.
{b no es un real}
