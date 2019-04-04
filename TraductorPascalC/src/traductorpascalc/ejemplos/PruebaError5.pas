program ejemplo5;

var 
    a:INTEGER; 
    b:INTEGER; 
    c:INTEGER;
begin
    a:= 1;
    b:= 1;
    c:= 3;
    repeat
        begin
            b := b +1;
        end
    until b == c;
end.
{hay 2 = en vez de uno}