program Ejercicio5;
{5. 
a. Realizar un módulo que reciba un par de números (numA,numB) y retorne si numB es el doble de numA.

b. Utilizando el módulo realizado en el inciso a., realizar un programa que lea secuencias de pares de
números hasta encontrar el par (0,0), e informe la cantidad total de pares de números leídos y la cantidad de
pares en las que numB es el doble de numA.

Ejemplo: si se lee la siguiente secuencia: (1,2) (3,4) (9,3) (7,14) (0,0) el programa debe informar los valores
4 (cantidad de pares leídos) y 2 (cantidad de pares en los que numB es el doble de numA).}
function DobledeA (numA,numB:real):boolean;
    var
        Esdoble:boolean;
    begin
        if (numA*2=numB) then
            Esdoble:=true
        else
            Esdoble:=false;
    DobledeA:=Esdoble;
    end;
var
    A,B:real;
    ParesT,Pares2xA:integer;
begin
    ParesT:=0;Pares2xA:=0;
    write('Ingrese el primer número: ');readln(A);
    write('Ingrese el segundo número: ');readln(B);
    while (A<>0) AND (B<>0) do begin
        DobledeA(A,B);
        if (DobledeA(A,B)=true) then begin
            writeln('El segundo número era el doble del primero.');
            Pares2xA:=Pares2xA+1
        end
        else
            writeln('El segundo número no era el doble del primero.');
        ParesT:=ParesT+1;
        write('Ingrese el primer número: ');readln(A);
        write('Ingrese el segundo número: ');readln(B);
    end;
    writeln('Se leyeron ',ParesT,' pares de números. En los cuales ',Pares2xA,' el segundo número era el doble del primero.');
end.