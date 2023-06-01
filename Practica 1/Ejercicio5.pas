
Program Ejercicio5;
{5. Realizar un programa que lea números enteros desde teclado. La lectura debe finalizar cuando se
ingrese el número 100, el cual debe procesarse. Informar en pantalla:
◦ El número máximo leído.
◦ El número mínimo leído.
◦ La suma total de los números leídos.}

Var 
  SUMA,MIN,MAX,N: integer;
Begin
  MIN := 32767;
  MAX := -32767;
  SUMA := 0;
  write('Ingrese un numero: ');
  readln(N);
  While (N<>100) Do
    Begin
      SUMA := SUMA+N;
      If (N>MAX) Then
        MAX := N;
      If (N<MIN) Then
        MIN := N;
      write('Ingrese otro numero: ');
      readln(N);
    End;
  writeln('El numero máximo leído fue ',MAX,', el mínimo ',MIN,
          ' y la suma de todos los números leídos es igual a ',SUMA,'.');
End.
