Program Ejercicio1;
{a. Dado un vector de enteros de a lo sumo 5 valores, realice un módulo que reciba dicho vector y un valor
n y retorne si n se encuentra en el vector o no.

b. Modifique el módulo del inciso a. considerando ahora que el vector se encuentra ordenado de manera
ascendente.

c. Modifique el módulo del inciso a. considerando ahora que el vector se encuentra ordenado de manera
descendente.}

const
    DF=5;
type
    vector=array [1..DF] of integer;

Procedure CargarV (var v:vector; var DL:integer);
var
    n:integer;
begin
    DL:=0;
    write('Ingrese un valor para almacenar: ');readln(n);
    while (DL<DF) and (n<>-1) do begin
        DL:=DL+1;
        v[DL]:=n;
        write('Ingrese un valor para almacenar: ');readln(n);
    end;
    writeln ('El vector se ha cargado con una Dimensión Lógica de ',DL,'.');
end;

Function Buscar (v:vector;n:integer;DL:integer):boolean;
var
    i:integer;
begin
    Buscar:=false;
    for i:= 1 to DL do
        if v[i]=n then
            Buscar:=true;
end;

Function DicotomicaAscendente (v:vector;DL:integer;n:integer):boolean;
var
    L,R,M:integer;
begin
    DicotomicaAscendente:=false;
    L:=1;
    R:=DL;
    M:=(R+L) DIV 2;
    while (L<=R) and (n<>v[M]) do begin
        if (n<v[M]) then
            R:=M-1
        else
            L:=M+1;
        M:=(L+R) DIV 2;
    end;
    DicotomicaAscendente:=(L<=R) and (v[M]=n);
end;

Function DicotomicaDescendente (v:vector;DL:integer;n:integer):boolean;
var
    L,R,M:integer;
begin
    DicotomicaDescendente:=false;
    L:=1;
    R:=DL;
    M:=(R+L) DIV 2;
    while (L<=R) and (n<>v[M]) do begin
        if (n>v[M]) then
            R:=M-1
        else
            L:=M+1;
        M:=(L+R) DIV 2;
    end;
    DicotomicaDescendente:=(L<=R) and (v[M]=n);
end;

var
    v:vector;
    n:integer;
    DL:integer;
begin
    CargarV(v,DL);
    write('Ingrese un número para buscar en el vector: ');readln(n);
   {if Buscar (v,n,DL)=true then
        writeln('El número existe.')
    else
        writeln('El número no existe.');}
    if DicotomicaDescendente (v,DL,n)=true then
        writeln('El número existe.')
    else
        writeln('El número no existe.');
end.