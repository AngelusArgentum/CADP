{5. Realizar un programa que lea números enteros desde teclado. La lectura debe finalizar cuando se
ingrese el número 100, el cual debe procesarse. Informar en pantalla:
◦ El número máximo leído.
◦ El número mínimo leído.
◦ La suma total de los números leídos.}
program TUKI;
var
    SUMA,MIN,MAX,N:integer;
begin
    MIN:=32767;MAX:=-32767;SUMA:=0;
    write('Ingrese un numero: ');readln(N);
    while(N<>100) do begin
        SUMA:=SUMA+N;
        if (N>MAX) then
            MAX:=N;
        if (N<MIN) then
            MIN:=N;
        write('Ingrese otro numero: ');readln(N);
    end;
    writeln('El numero máximo leído fue ',MAX,', el mínimo ',MIN,' y la suma de todos los números leídos es igual a ',SUMA,'.');
end.