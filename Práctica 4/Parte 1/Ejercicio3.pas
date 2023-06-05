Program Ejercicio3;
{3. Se dispone de un vector con números enteros, de dimensión física dimF y dimensión lógica dimL.
 El vector se cargará hasta que aparezca el número 5 o la dimensión Fisica sea alcanzada por la Logica.

a) Realizar un módulo que imprima el vector desde la primera posición hasta la última (dimL).

b) Realizar un módulo que imprima el vector desde la última posición hasta la primera (dimL).

c) Realizar un módulo que imprima el vector desde la mitad (dimL DIV 2) hacia la primera posición, y
desde la mitad más uno hacia la última posición.

d) Realizar un módulo que reciba el vector, una posición X y otra posición Y, e imprima el vector desde la
posición X hasta la Y. Asuma que tanto X como Y son menores o igual a la dimensión lógica. Y considere
que, dependiendo de los valores de X e Y, podría ser necesario recorrer hacia adelante o hacia atrás.}

const
    dimF=5
type
    vector=array [1..dimF] of integer;

Procedure CargarVector (var v:vector; var dimL:integer;)
var
    num:integer;
begin
    dimL:=0;
    write ('Ingrese un número: '); readln (num);
    while (num<>5) AND (dimL<dimF) do begin
        dimL:=dimL+1;
        v[dimL]:=num;
        write ('Ingrese un número: '); readln (num);
    end;
end;

{-----------------------------------------------------}

Procedure IncisoA (v:vector; dimL:integer); 
var
    i:integer;
begin
    for i:= 1 to dimL do begin
        writeln(v[i]);
    end;
end;

{-----------------------------------------------------}

Procedure IncisoB (v:vector; dimL:integer);
var
    i:integer;
begin
    for i:= dimL downto 1 do begin
        writeln(v[i]);
    end;
end;

{-----------------------------------------------------}

Procedure IncisoC (v:vector, dimL:integer);
var
    i,mitad:integer;
begin
    mitad:= dimL MOD 2;
    for i:= 1 to mitad do begin
        writeln(v[i]);
    end;
    for i:= (mitad+1) to dimL do begin
        writeln(v[i]);
    end;
end;

{-----------------------------------------------------}

Procedure IncisoD (v:vector, X:integer, Y:integer);
var
    i:integer;
begin
    if (X<=Y) then
        for i:= X to Y do begin
            writeln(v[i]);
        end;
    else
        for i:= X downto Y do begin
            writeln(v[i]);
        end;
end;