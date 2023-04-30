program Ejercicio7;
{7.
a. Realizar un módulo que reciba como parámetro un número entero y retorne la cantidad de dígitos que
posee y la suma de los mismos.

b. Utilizando el módulo anterior, realizar un programa que lea una secuencia de números e imprima la
cantidad total de dígitos leídos. La lectura finaliza al leer un número cuyos dígitos suman exactamente 10, el
cual debe procesarse.}
procedure ContarSumarDig(N:integer ; var CantDig,SumaDig:integer);
    begin
        if (N DIV 10 <> 0) then begin       {Revisa si el cociente es diferente de 0}
            while (N DIV 10 <> 0) do begin
                CantDig:=CantDig+1;         {Suma un digito cada vez que entra en el loop}
                SumaDig:=SumaDig+N MOD 10; {Suma el digito que queda almacenado en el resto, el MOD}
                N:=N DIV 10;
            end;
        end;
        CantDig:=CantDig+1; {Independientemente del número ingresado, siempre tiene la menos un digito}
        SumaDig:=SumaDig+N; {Suma el ultimo digito}
    end;
var
    N,SumaDig,CantDig:integer;
begin
    write('Ingrese un número: ');readln(N);
    ContarSumarDig(N,CantDig,SumaDig);      {Se le asigna a cada parametro una variable local al programa,
        no se inicializan porque se les asigna valor al ejecutar el procedimiento}
    writeln('El número ingresado posee ',CantDig,' digitos, y la suma de ellos es igual a ',SumaDig,'.');
end.