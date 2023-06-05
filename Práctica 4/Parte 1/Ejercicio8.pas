Program Ejercicio8;
{8. Realizar un programa que lea y almacene la información de 3 alumnos ingresantes a la Facultad de
Informática de la UNLP en el año 2020. De cada alumno se lee: nro de inscripción, DNI, apellido, nombre y
año de nacimiento. Una vez leída y almacenada toda la información, calcular e informar:

a) El porcentaje de alumnos con DNI compuesto sólo por dígitos pares.

b) Apellido y nombre de los dos alumnos de mayor edad.}

const
    DF=3;
    A=2020;
type
    alumnos2020=record
        NI:integer;
        DNI:longint;
        apellido:string;
        nombre:string;
        born:integer;
    end;
    vector=array [1..DF] of alumnos2020;


Procedure RegistrarAlumnos (var v:vector);
var
    i:integer;
begin
    for i:= 1 to DF do begin
        with v[i] do begin
            write('Ingrese el Nro. de Insc. del alumno: ');readln(NI);
            write('Ingrese el DNI del alumno: ');readln(DNI);
            write('Ingrese el apellido del alumno: ');readln(apellido);
            write('Ingrese el nombre del alumno: ');readln(nombre);
            write('Ingrese el año de nacimiento del alumno: ');readln(born);
            writeln('-------------------------');
        end;
    end;
end;

Procedure InformarAlumnos (v:vector);
var
    i:integer;
begin
    for i:=1 to DF do begin
        with v[i] do begin
            writeln(NI);
            writeln(DNI);
            writeln(apellido);
            writeln(nombre);
            writeln(born);
            writeln('-------------------------');
        end;
    end;
end;

Procedure AlumnosMayores (v:vector; var Amax1,Amax2,Nmax1,Nmax2:string; var Emax1,Emax2:integer);
var
    i:integer;
begin
    Emax1:=-2021;
    Emax2:=-2021;
    for i:=1 to DF do begin
        if (A-v[i].born)>Emax1 then begin
            Emax2:=Emax1;
            Amax2:=Amax1;
            Nmax2:=Nmax1;
            Emax1:=A-v[i].born;
            Amax1:=v[i].apellido;
            Nmax1:=v[i].nombre
        end
        else if (A-v[i].born)>Emax2 then begin
            Emax2:=A-v[i].born;
            Amax2:=v[i].apellido;
            Nmax2:=v[i].nombre
        end;
    end;
end;

Function DigitosPares (v:vector):real;
var
    i,cant,d:integer;
    N:longint;
begin
    cant:=0;
    for i:=1 to DF do begin
        N:=v[i].DNI;
        d:=N MOD 10;
        while (N>0) AND (d MOD 2 = 0) do
            if (d MOD 2 = 0) then begin
                N:= N DIV 10;
                d:=N MOD 10
            end;
        if (N=0) then
            cant:=cant+1;
    end;
    DigitosPares:=100/DF*cant;
end;

var
    v:vector;
    Amax1,Amax2,Nmax1,Nmax2:string;
    Emax1,Emax2:integer;
begin
    RegistrarAlumnos (v);
    InformarAlumnos (v);
    AlumnosMayores (v,Amax1,Amax2,Nmax1,Nmax2,Emax1,Emax2);
    writeln('Alumnos más grandes: ',Amax1,' ',Nmax1,' y ',Amax2,' ',Nmax2,'.');
    writeln(DigitosPares(v):0:2,'% de los alumnos tienen un DNI con todos sus digitos pares.');
end.