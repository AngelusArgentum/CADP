{6. Realizar un programa que lea información de 200 productos de un supermercado. De cada producto
se lee código y precio (cada código es un número entre 1 y 200). Informar en pantalla:
- Los códigos de los dos productos más baratos.
- La cantidad de productos de más de 16 pesos con código par.}
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