Program Ejemplo3;
const
    DF=10;
type
    vector=array [1..DF] of integer;

Procedure CargarV (var v:vector; var DL:integer);
var
    Num:integer;
begin
    DL:=0;
    write('Ingrese un número: ');readln(Num);
    while (Num>-1) AND (DL<=DF) do begin
        DL:=DL+1;
        v[DL]:=Num;
        write('Ingrese un número: ');readln(Num);
    end;
end;

Function Buscar (v: vector; DL:integer; N:integer):boolean;
var
    pos:integer;
begin
    Buscar:=false;
    pos:=1;
    while (pos<=DL) AND (Buscar=false) do begin
        if (v[pos]=N) then
            Buscar:=true
        else
            pos:=pos+1;
    end;
end;

Function Existe (v:vector;DL:integer;N:integer):boolean;
var
    pos:integer;
begin
    pos:=1;
    Existe:=false;
    while (pos<=DL) AND (v[pos]<N) do begin
        pos:=pos+1;
    end;
    Existe:= (pos<=DL) AND (v[pos]=N);
end;

Function Dicotomica (v:vector;DL:integer;N:integer):boolean;
var
    L,R,M:integer;
begin
    Dicotomica:=false;
    writeln('DL=',DL,'.');
    L:=1; R:=DL; M:=(L+R) DIV 2;
    while (L<=R) AND (v[M]<>N) do begin
        if (N < v[M]) then
            R:=M-1
        else
            L:=M+1;
        M:=(L+R) DIV 2;
    end;
    Dicotomica:= (L<=R) AND (N=v[M]);
end;
var
    v:vector;
    DL,N:integer;
begin
    CargarV(v,DL);
    write('Ingrese el número a buscar: ');readln(N);
    
   {if (Buscar(v,DL,N)=true) then
        writeln('El vector contiene el número solicitado.')
    else
        writeln('El vector no contiene el número solicitado.');} {<-- Búsqueda en vector Desordenado.}
    
  if (Existe(v,DL,N)=true) then
        writeln('El vector contiene el número solicitado.')
    else
        writeln('El vector no contiene el número solicitado.'); {<-- Búsqueda mejorada en vector Ordenado de menor a mayor.}
    
  if (Dicotomica(v,DL,N)=true) then
        writeln('El vector contiene el número solicitado.')
    else
        writeln('El vector no contiene el número solicitado.'); {<-- Búsqueda dicotómica/binaria en vector Ordenado de menor a mayor.}
end.