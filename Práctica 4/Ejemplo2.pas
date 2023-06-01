Program Ejemplo2;
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
    while (v[i] MOD multi <> 0) and (i<=tam) do begin  { En este caso se desconocería si existe algún múltiplo de 3 en el vector, por lo que
        i:=i+1;                                                                     se condiciona el recorrido al tamaño del vector. Si i es mayor que tam (10), entonces
    end;                                                                               se indicará al final que no existe un múltiplo de 3. }
    Pos:=i;
end;

var
    v:vector;
begin
    CargarV (v);
    if (Pos (v) <= tam) then
        writeln('La posición en la que se encuentra el primer múltiplo de ',multi,' es la ',Pos(v),'.')
    else
        writeln('No se encontraron múltiplos de 3 en el vector.');
end.