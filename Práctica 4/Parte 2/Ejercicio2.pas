Program Ejercicio2;
{Realice un programa que resuelva los siguientes incisos:

a. Lea nombres de alumnos y los almacene en un vector de a lo sumo 5 elementos. La lectura finaliza
cuando se lee el nombre ‘ZZZ’, que no debe procesarse.

b. Lea un nombre y elimine la primera ocurrencia de dicho nombre en el vector.

c. Lea un nombre y lo inserte en la posición 3 del vector.

d. Lea un nombre y lo agregue al vector.

NOTA: Realizar todas las validaciones necesarias.}

const
    DF=5;
type
    vector=array [1..DF] of string;


Procedure CargarV (var v:vector ; var DL:integer);
var
    nombre:string;
begin
    DL:=0;
    write('Ingrese el nombre de un alumno: ');readln(nombre);
    while (DL<DF) AND (nombre<>'ZZZ') do begin
        DL:=DL+1;
        v[DL]:=nombre;
        write('Ingrese el nombre de un alumno: ');readln(nombre);
    end;
    writeln('La dimensión lógica del vector es de ',DL,'.');
end;


Procedure Informar (v:vector ; DL:integer); {Procedimiento auxiliar utilizado para confirmar el correcto funcionamiento.}
var
    i:integer;
begin
    writeln('------------------------------------------------------------------');
    for i:=1 to DL do
        writeln(v[i]);
    writeln('------------------------------------------------------------------');
end;


Procedure EliminarNombre (var v:vector; var DL:integer);
var
    nombre:string;
    i:integer;
begin
    i:=1;
    write('Ingrese el nombre del que quiere eliminar la primera ocurrencia: ');readln(nombre);
    while (i<=DL) AND (v[i] <> nombre) do
        i:=i+1;
    if (i<=DL) then begin
        for i:=i to (DL-1) do
            v[i]:=v[i+1];
        DL:=DL-1
    end
    else
        writeln('El nombre no se encontraba en el vector.');
end;


Procedure InsertarEn3 (var v:vector; var DL:integer);
var
    i:integer;
    nombre:string;
begin
    write('Ingrese un nombre. El mismo se insertará en la posición 3 del vector de ser posible: ');readln(nombre);
    if (DL+1<=DF) then begin
        for i:=(DL+1) downto 4 do
            v[i]:=v[i-1];
        v[3]:=nombre;
        DL:=DL+1
    end
    else
        writeln('El vector está lleno, por lo que no puede insertarse el nombre ',nombre,'.');
end;

Procedure Agregar (var v:vector; var DL:integer);
var
    nombre:string;
begin
    write('Ingrese un nombre para agregar al vector: ');readln(nombre);
    if (DL+1<=DF) then begin
        DL:=DL+1;
        v[DL]:=nombre;
    end
    else
        writeln('El vector está lleno. No se ha podido añadir el nombre.');
end;

var
    v:vector;
    DL:integer;
begin
    CargarV (v,DL);
    EliminarNombre (v,DL);
    InsertarEn3 (v,DL);
    Agregar (v,DL);
    Informar (v,DL);
end.