program Ejercicio6;
{6. Realizar un programa modularizado que lea datos de 100 productos de una tienda de ropa. Para cada
producto debe leer el precio, código y tipo (pantalón, remera, camisa, medias, campera, etc.). Informar:
● Código de los dos productos más baratos.
● Código del producto de tipo “Pantalón” más caro.
● Precio promedio.}
procedure DosMinimos (P:real;C:integer;var Min1,Min2:real;var CMin1,CMin2:integer);
    begin
        if (P<Min1) then begin
            Min2:=Min1;
            Min1:=P;
            CMin2:=CMin1;
            CMin1:=C
        end
        else if (P<Min2) then begin
            Min2:=P;
            CMin2:=C
        end;
    end;
function PantCMax (P:real;C:integer;T:string;PMAX:real):integer;
    begin
        if (T='pant') then
            if (P>PMAX) then begin
                PMAX:=P;
                PantCMax:=C;
            end;
    end;
var
    P,Min1,Min2,PMAX,Total:real;
    C,CMin1,CMin2,prod,CanTotal:integer;
    T:string;
begin
    Total:=0;   CMin1:=0;   CMin2:=0;   Min1:=99999;    Min2:=99999; CanTotal:=0;   Total:=0; PMAX:=0;
    for prod:=1 to 100 do begin
        write('Ingrese precio del producto: ');readln(P);
        write('Ingrese código del producto: ');readln(C);
        write('Ingrese tipo de producto: ');readln(T);
        DosMinimos (P,C,Min1,Min2,Cmin1,Cmin2);
        PantCMax(P,C,T,PMAX);
        Total:=Total+P;
        CanTotal:=CanTotal+1;
    end;
    writeln('Los dos productos más baratos tienen el código ',CMin1,' y ',CMin2,'. El pantalón más caro tiene el código ',PantCMax(P,C,T,PMAX),'. Y el precio promedio de los productos es de ',Total/canTotal:1:2,'.');
end.