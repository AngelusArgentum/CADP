program Ejercicio11;
{11. Realizar un programa modularizado que lea una secuencia de caracteres y verifique si cumple con el patrón
A%B*, donde:
- A es una secuencia de caracteres en la que no existe el carácter ‘$’.
- B es una secuencia con la misma cantidad de caracteres que aparecen en A y en la que aparece a lo sumo
3 veces el carácter ‘@’.
- Los caracteres % y * seguro existen
Nota: en caso de no cumplir, informar que parte del patrón no se cumplió.}
Function NoEsPesos (c:char):boolean;
begin
    NoEsPesos:=(c<>'$');
end;


Procedure ChequearA (var cumple:boolean; var CharA:integer);
var
    c:char;
begin
    writeln('Ingrese la secuencia A.');readln(c);
    while (cumple) AND (c<>'%') do begin
        if (NOT NoEsPesos(c)) then
            cumple:=false
        else begin
            readln(c);
            CharA:=CharA+1
        end;
    end;
end;


Procedure ChequearB (var cumple:boolean; var CharA:integer);
var
    c:char;
    CharB,Arrobas:integer;
begin
    CharB:=0; Arrobas:=0;
    writeln('Ingrese la secuencia B.');readln(c);
    while (c<>'*') do begin
        if (c='@') then begin
            Arrobas:=Arrobas+1;
            CharB:=CharB+1;
            readln(c)
        end
        else begin
            CharB:=CharB+1;
            readln(c);
        end;
    end;
    if (NOT((Arrobas>=3) AND (CharB=CharA))) then
        cumple:=false;
end;

var
    cumple:boolean;
    CharA:integer;
begin
    CharA:=0; cumple:=true;
    ChequearA(cumple,CharA);
    if (cumple) then begin
        ChequearB(cumple,CharA);
        if (cumple) then
            writeln('Se cumple la secuencia.')
        else
            writeln('La secuencia no se cumple en B.');
    end
    else
        writeln('La secuencia no se cumple en A.');
end.