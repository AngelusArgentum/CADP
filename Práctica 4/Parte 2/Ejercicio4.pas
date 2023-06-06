Program Ejercicio4;
{4. Una cátedra dispone de información de sus alumnos (a lo sumo 1000). De cada alumno se conoce nro de
alumno, apellido y nombre y cantidad de asistencias a clase. 
Dicha información se encuentra ordenada POR NRO DE ALUMNO DE MANERA ASCENDENTE. Se pide:

c. Un módulo que reciba la posición de un alumno dentro del vector y lo elimine.

d. Un módulo que reciba un nro de alumno y elimine dicho alumno del vector

e. Un módulo que elimine del vector todos los alumnos con cantidad de asistencias en 0.

Nota: Realizar el programa principal que invoque los módulos desarrollados en los incisos previos con datos
leídos de teclado.}
const
    DF=1000;
type
    alumno=record
        nro:integer;
        ape:string;
        nom:string;
        asist:integer;
    end;
    
    alumnos=array [1..DF] of alumno;

Procedure CargarAlumno (var a:alumno);
begin
    with a do begin
        writeln('------------------------------------------------------');
        writeln('Ingrese el NRO de alumno: ');readln(nro);
        if (nro>0) do begin
            writeln('Ingrese el apellido del alumno: ');readln(ape);
            writeln('Ingrese el nombre del alumno: ');readln(nom);
            writeln('Ingrese la cantidad de asistencias del alumno: ');readln(asist);
            writeln('------------------------------------------------------');
        end;
    end;
end;

Procedure CargarV (var v:alumnos; var DL:integer;);
var
    a:alumno;
begin
    CargarAlumno(a);
    DL:=0;
    while (DL>=DF) AND (a.nro>0) do begin
        DL:=DL+1;
        v[DL]:=a;
        CargarAlumno(a);
    end;
end;

{a. Un módulo que retorne la posición del alumno con un nro de alumno recibido por parámetro. El
alumno seguro existe.}

    {PosicionDelNro:=0;
    i:=1;
    while (i<=DL) AND (v[i].nro <> n) do
        if (v[i].nro <> n) then
            i:=i+1
        else
            PosicionDelNro:=i; <--- DEBERIA USAR DICOTOMICA.}

Function PosicionDelNro (v:alumnos ; n:integer ; DL:integer):integer;
var
    L,R,M:integer;
begin
    L:=1;
    R:=DL;
    M:=(L+R) DIV 2;
    while (L<=R) AND (v[M].nro <> n) do begin
        if N<v[M].nro then
            R:=M-1
        else
            L:=M+1;
        M:=(L+R) DIV 2;
    end;
    PosicionDelNro:=M;
end;

{b. Un módulo que reciba un alumno y lo inserte en el vector.}