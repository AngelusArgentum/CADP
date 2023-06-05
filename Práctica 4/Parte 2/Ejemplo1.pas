Program Ejemplo1;
{Haga un programa que lea una secuencia de numeros terminada en 0. 
Informar la cantidad de veces que aparece cada digito.}
type
    digitos=0..9;
    numeros=array [digitos] of integer;

Procedure InicializarV (var v:numeros);
var
    i:digitos;
begin
    for i:=0 to 9 do
        v[i]:=0;
end;

Procedure DescomponerDigitos (var v:numeros;numero:integer);
var
    digito:digitos;
begin
    while (numero<>0) do begin
        digito:=numero MOD 10;
        v[digito]:=v[digito]+1;
        numero:=numero DIV 10;
    end;
end;

Procedure Informar (v:numeros);
var
    i:digitos;
begin
    for i:=0 to 9 do
        writeln('El dígito ',i,' aparece un total de ',v[i],' veces.');
end;

var
    v:numeros;
    n:integer;

begin
    InicializarV (v);
    write('Ingrese un número: ');readln(n);
    while (n<>0) do begin
        DescomponerDigitos(v,n);
        write('Ingrese un número: ');readln(n);
    end;
    Informar(v);
end.