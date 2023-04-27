{6. Realizar un programa que lea información de 200 productos de un supermercado. De cada producto
se lee código y precio (cada código es un número entre 1 y 200). Informar en pantalla:
- Los códigos de los dos productos más baratos.
- La cantidad de productos de más de 16 pesos con código par.}
program TUKI;
var
    {precio,bajo1,bajo2:real; -> Los precios se expresan en reales,
    pero al no poder utilizar DIV o MOD para definir si son pares o no,
    el problema no es solucionable sin asignarles un valor entero.}
    precio16par,code,precio,bajo1,bajo2:integer;
begin
    precio16par:=0;bajo1:=32767;bajo2:=32767;
    for code:= 1 to 5 do begin
        write('Ingrese el precio del producto con código ',code,':');readln(precio);
        if (precio>16) AND (precio MOD 2=0) then
            precio16par:=precio16par+1;
        if (precio<bajo1) then begin
            bajo2:=bajo1;
            bajo1:=precio
        end
        else if (precio<bajo2) AND (precio<>bajo1) then
            bajo2:=precio;
    end;
    writeln('Los precios mas bajos son ',bajo1,' y ',bajo2,'. La cantidad de precios pares mayores a 16 es de ',precio16par,'.');
end.