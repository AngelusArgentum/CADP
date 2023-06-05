Program Ejemplo3;
{Haga un programa que lea una secuencia de numeros terminada en 0. 
Informar para cada número cuál es el dígito que más veces aparece.}
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

Function Informar (v:numeros):integer;
var
    i:digitos;
    max:integer;
begin
    max:=-1;
    for i:=0 to 9 do
        if (v[i]>max) then begin
            max:=v[i];
            Informar:=i
        end;
end;

var
    v:numeros;
    n:integer;

begin
    write('Ingrese un número: ');readln(n);
    while (n<>0) do begin
        InicializarV (v);
        DescomponerDigitos(v,n);
        writeln('En ',n,' el dígito que más veces aparece es el ',Informar(v),'.');
        write('Ingrese un número: ');readln(n);
    end;
end.