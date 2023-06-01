Program Ejemplo1;
const
    tam=10;
    multi=3;
type
    vector=array [1..tam] of integer;

Procedure CargarV (var v:vector);
var
    i:integer;
begin
    for i:=1 to tam do begin
        write ('Ingrese el número a colocar en la posición ',i,': '); readln (v[i]); 
    end;
end;

Function Pos (v:vector):integer;
var
    i:integer;
begin
    i:=1;
    while (v[i] MOD multi <> 0) do begin { En este caso se sabe que en el vector existirá un número que sea múltiplo de 3 }
        i:=i+1;
    end;
    Pos:=i;
end;

var
    v:vector;
begin
    CargarV (v);
    writeln('La posición en la que se encuentra el primer múltiplo de ',multi,' es la ',Pos(v),'.');
end.