program Ejercicio9;
{9. Realizar un programa modularizado que lea información de alumnos de una facultad. Para cada alumno se
lee: número de inscripción, apellido y nombre. La lectura finaliza cuando se ingresa el alumno con número de
inscripción 1200, que debe procesarse. Se pide calcular e informar:
● Apellido de los dos alumnos con número de inscripción más chico.
● Nombre de los dos alumnos con número de inscripción más grande.
● Porcentaje de alumnos con nro de inscripción par.}
Procedure LeerDatos (var NI:integer;var apellido,nombre:string);
    begin
        write('Ingrese el número de inscripción del alumno: ');readln(NI);
        write('Ingrese el apellido del alumno: ');readln(apellido);
        write('Ingrese el nombre del alumno: ');readln(nombre);
    end;


Procedure InscPar (NI:integer;var Pares:integer);
    begin
        if (NI MOD 2 = 0) then
            Pares:=Pares+1
    end;


Procedure ApellidosNIMin (apellido:string;NI:integer;var Amin1,Amin2:string;var NIMin1,NIMin2:integer);
    begin
        if  (NI<NIMin1) then begin
            NIMin2:=NIMin1;
            NIMin1:=NI;
            Amin2:=Amin1;
            Amin1:=apellido
        end
        else if (NI<NIMin2) then begin
            NIMin2:=NI;
            AMin2:=apellido;
        end;
    end;
    
    
Procedure NombresNIMax (nombre:string;NI:integer;var NMax1,NMax2:string;var NIMax1,NIMax2:integer);
    begin
        if  (NI>NIMax1) then begin
            NIMax2:=NIMax1;
            NMax2:=NMax1;
            NIMax1:=NI;
            NMax1:=nombre;
        end
        else if (NI>NIMax2) then begin
            NIMax2:=NI;
            NMax2:=nombre;
        end;
    end;


var
    NI,NIMax1,NIMax2,NIMin1,NIMin2,Pares,AlumnosT:integer;
    nombre,NMax1,NMax2,apellido,AMin1,AMin2:string;
begin
    NIMax1:=-1; NIMax2:=-1; NIMin1:=9999;   NIMin2:=9999;   Pares:=0;   AlumnosT:=0;
    NMax1:='und';   NMax2:='und';   AMin1:='und';   Amin2:='und';
    repeat
        LeerDatos(NI,apellido,nombre);
        InscPar(NI,Pares);
        ApellidosNIMin(apellido,NI,Amin1,Amin2,NIMin1,NIMin2);
        NombresNIMax(nombre,NI,NMax1,NMax2,NIMax1,NIMax2);
        AlumnosT:=AlumnosT+1;
    until   (NI=1200);
    writeln('Los apellidos de los alumnos con NI más chico son: ',AMin1,' y ',AMin2,'.');
    writeln('Los nombres de los alumnos con NI más alto son: ',NMax1,' y ',NMax2,'.');
    writeln('El porcentaje de alumnos con NI par representa el ',100*Pares/AlumnosT:1:2);
end.