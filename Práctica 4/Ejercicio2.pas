Program Ejercicio2;

const
    dimF = 5;
type
    vdatos = array[1..dimF] of real;

Procedure cargarVector(var v:vdatos; var dimL : integer);
{a) El módulo cargarVector debe leer números reales y almacenarlos en el vector que se pasa como
parámetro. Al finalizar, debe retornar el vector y su dimensión lógica. La lectura finaliza cuando se ingresa
el valor 0 (que no debe procesarse) o cuando el vector está completo.}

var
    num:real;
begin
    write('Ingrese un número real: '); readln(num);
    while (num<>0) AND (dimL<dimF) do begin
        dimL:=dimL+1;
        v[dimL]:=num;
        write ('Ingrese un número real: '); readln(num);
    end;
end;

Procedure modificarVectorySumar(var v:vdatos; dimL : integer; n: real; var suma: real);
{b) El módulo modificarVectorySumar debe devolver el vector con todos sus elementos incrementados con
el valor n y también debe devolver la suma de todos los elementos del vector.}
var
    i:integer;
begin
    for i:=1 to dimL do begin
        suma:=suma+n+v[i];
    end;
end;

var
    datos : vdatos;
    dimL : integer;
    num, suma : real;
begin
    dimL:= 0;
    suma:= 0;
    cargarVector (datos,dimL);
    write ('Ingrese un valor a sumarle a todos los elementos: '); readln (num);
    modificarVectorySumar (datos,dimL,num,suma);
    writeln ('La suma de los valores es: ',suma:0:2,'.');
    writeln ('Se procesaron: ',dimL,' números.');
end.