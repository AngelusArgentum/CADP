
Program Ejercicio6;

{6. Realizar un programa que lea información de 200 productos de un supermercado. De cada producto
se lee código y precio (cada código es un número entre 1 y 200). Informar en pantalla:
- Los códigos de los dos productos más baratos.
- La cantidad de productos de más de 16 pesos con código par.}

Var 

{precio,bajo1,bajo2:real; -> Los precios se expresan en reales,
    pero al no poder utilizar DIV o MOD para definir si son pares o no,
    el problema no es solucionable sin asignarles un valor entero.}
  precio16par,code,precio,bajo1,bajo2: integer;
Begin
  precio16par := 0;
  bajo1 := 32767;
  bajo2 := 32767;
  For code:= 1 To 5 Do
    Begin
      write('Ingrese el precio del producto con código ',code,':');
      readln(precio);
      If (precio>16) And (precio Mod 2=0) Then
        precio16par := precio16par+1;
      If (precio<bajo1) Then
        Begin
          bajo2 := bajo1;
          bajo1 := precio
        End
      Else If (precio<bajo2) And (precio<>bajo1) Then
             bajo2 := precio;
    End;
  writeln('Los precios mas bajos son ',bajo1,' y ',bajo2,
          '. La cantidad de precios pares mayores a 16 es de ',precio16par,'.');
End.
