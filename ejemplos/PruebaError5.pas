program ejemplo5;

VAR
    a:INTEGER;
    b:INTEGER;
    c:INTEGER;
BEGIN
    a:= 1;
    b:= 1;
    c:= 3;
    repeat
        BEGIN
            b := b +1;
        END
    until b == c;
END.
{hay 2 = en vez de uno}
