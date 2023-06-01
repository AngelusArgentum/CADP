program Ejercicio6;
{6. a. Realice un módulo que lea de teclado números enteros hasta que llegue un valor negativo. Al finalizar la
lectura el módulo debe imprimir en pantalla cuál fue el número par más alto.
b. Implemente un programa que invoque al módulo del inciso a.}
procedure NotNegative;
    var
        N,NPM:integer;
    begin
        NPM:=-1;
        write('Ingrese un número entero: ');readln(N);
        while(N>=0)do begin
            if (N MOD 2=0) then
                if (N>NPM) then
                    NPM:=N;
            write('ingrese otro número entero: ');readln(N);
        end;
        if (NPM>-1) then
            writeln('El mayor número entero par leído fue el ',NPM,'.')
        else
            writeln('No se leyeron números pares positivos.');
    end;
begin
    NotNegative;
end.