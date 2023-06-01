program Ejercicio7;
{7.
a. Realizar un módulo que reciba como parámetro un número entero y retorne la cantidad de dígitos que
posee y la suma de los mismos.

b. Utilizando el módulo anterior, realizar un programa que lea una secuencia de números e imprima la
cantidad total de dígitos leídos. La lectura finaliza al leer un número cuyos dígitos suman exactamente 10, el
cual debe procesarse.}
procedure ContarSumarDig(N:integer ; var CantDig,SumaDig:integer);
    begin
        CantDig:=0; SumaDig:=0;
        while (N <> 0) do begin
            CantDig:=CantDig+1;                                         {Suma un digito cada vez que entra en el loop}
            SumaDig:=SumaDig+N MOD 10;                                  {Suma el digito que queda almacenado en el resto, el MOD}
            N:=N DIV 10;
        end;
        writeln('El número ingresado posee ',CantDig,' digitos, y la suma de ellos es igual a ',SumaDig,'.');
    end;
var
    N,SumaDig,CantDig,TCantDig:integer;
begin
    TCantDig:=0;
    repeat
        write('Ingrese un número: ');readln(N);
        ContarSumarDig(N,CantDig,SumaDig);
        TCantDig:=CantDig+TCantDig;
    until (SumaDig=10);
    writeln('Se leyeron un total de ',TCantDig,' digitos.');
end.