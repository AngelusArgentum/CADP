program Ejercicio5;
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
procedure ContarPares(resultado:boolean;var ParesT,Pares2xA:integer);
    begin
        if (resultado=true) then begin
            writeln('El segundo número era el doble del primero.');
            Pares2xA:=Pares2xA+1
        end
        else
            writeln('El segundo número no era el doble del primero.');
            ParesT:=ParesT+1;
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
        ContarPares(DobledeA(A,B),ParesT,Pares2xA);
        write('Ingrese el primer número: ');readln(A);
        write('Ingrese el segundo número: ');readln(B);
    end;
    writeln('Se leyeron ',ParesT,' pares de números. En los cuales ',Pares2xA,' el segundo número era el doble del primero.');
end.