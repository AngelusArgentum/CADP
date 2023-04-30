program Ejercicio8;
{8. Realizar un programa modularizado que lea secuencia de números enteros. La lectura finaliza cuando llega el
número 123456, el cual no debe procesarse. Informar en pantalla para cada número la suma de sus dígitos
pares y la cantidad de dígitos impares que posee.}
Function    SumaDigPares(N:longint):integer;
    begin
        SumaDigPares:=0;
        while (N<>0) do begin
            if (N MOD 10 MOD 2=0) then begin
                SumaDigPares:=SumaDigPares+N MOD 10;
                N:=N DIV 10;
            end
            else begin
                N:=N DIV 10
            end;
        end;
        write ('La suma de los dígitos pares del número es igual a ',SumaDigPares,'.');
    end;
Function    CantDigImp (N:longint):integer;
    begin
        CantDigImp:=0;
        while (N<>0) do begin
            if (N MOD 10 MOD 2<>0) then begin
                CantDigImp:=CantDigImp+1;
                N:=N DIV 10
            end
            else
                N:=N DIV 10;
        end;
        writeln(' La cantidad de dígitos impares del numero es de ',CantDigImp,'.');
    end;
var
    N:longint;
begin
    write ('Ingrese un número entero: ');readln(N);
    while (N<>123456) do begin
        SumaDigPares(N);
        CantDigImp(N);
        write('Ingrese un número entero: ');readln(N);
    end;
end.