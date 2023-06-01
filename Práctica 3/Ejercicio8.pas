Program Ejercicio8;
{La Comisión Provincial por la Memoria desea analizar la información de los proyectos presentados en el programa
Jóvenes y Memoria durante la convocatoria 2020. Cada proyecto posee un código único, un título, el docente
coordinador (DNI, nombre y apellido, email), la cantidad de alumnos que participan del proyecto, el nombre de la
escuela y la localidad a la que pertenecen. 

Cada escuela puede presentar más de un proyecto. 

La información se ingresa ordenada consecutivamente por localidad y, para cada localidad, por escuela. Realizar un programa que

lea la información de los proyectos hasta que se ingrese el proyecto con código -1 (que no debe procesarse), e
informe:
● Cantidad total de escuelas que participan en la convocatoria 2020 y cantidad de escuelas por cada localidad.
● Nombres de las dos escuelas con mayor cantidad de alumnos participantes.
● Título de los proyectos de la localidad de Daireaux cuyo código posee igual cantidad de dígitos pares e impares.}

type
    coordinadores=record
        DNI:integer;
        Nombre:string;
        Apellido:string;
        email:string;
    end;

    proyectos=record
        code:integer;
        localidad:string;
        escuela:string;
        cantALU:integer;
        titulo:string;
        docente:coordinadores;
    end;


Procedure LeerDatosDC(var dc:coordinadores);
    begin
        write ('Ingrese el DNI del docente coordinador: '); readln(dc.DNI);
        write ('Ingrese el nombre del docente coordinador: '); readln(dc.nombre);
        write ('Ingrese el apellido del docente coordinador: '); readln(dc.apellido);
        write ('Ingrese el email del docente coordinador: '); readln(dc.email);
    end;
    

Procedure LeerDatosP (var p:proyectos);
    begin
        write('Ingrese el código del proyecto: ');readln(p.code);
        if (p.code <> -1) then begin
            write('Ingrese la localidad del proyecto: ');readln(p.localidad);
            write('Ingrese la escuela del proyecto: ');readln(p.escuela);
            write('Ingrese la cantidad de alumnos del proyecto: ');readln(p.cantALU);
            write('Ingrese el título del proyecto: ');readln(p.titulo);
            writeln('Ingrese los datos del docente coordinador.');
            LeerDatosDC (p.docente);
        end;
    end;


Procedure DobleMasAlumnos (var aluMAX1:integer; var aluMAX2:integer; var escMAX1:string; var escMAX2:string; cantALU:integer; escuela:string);
    begin
        if (cantALU > aluMAX1) then begin
            aluMAX2:=aluMAX1;
            escMAX2:=escMAX1;
            aluMAX1:=cantALU;
            escMAX1:=escuela;
        end
        else if (cantALU>aluMAX2) then begin
            aluMAX2:=cantALU;
            escMAX2:=escuela;
        end;
    end;
    
Procedure ParesImpares (cantALU:integer ; var PigualI:integer);
    var
    Impares,Pares:integer;
    begin
        Pares:=0; Impares:=0;
        while (cantALU DIV 10 <> 0) do begin
            if (cantALU MOD 2 = 0) then
                Pares:=Pares+1
            else
                Impares:=Impares+1;
            cantALU:=cantALU DIV 10;
        end;
        if (Pares=Impares) then
            PigualI:=PigualI+1;
    end;

var
    proyecto:proyectos;
    cantescuelasT,aluMAX1,aluMAX2,PigualI,DaireauxPI,cantACT:integer;
    escMAX1,escMAX2,locACT:string;
begin
    cantescuelasT:=0; aluMAX1:= -1; aluMAX2:=-2; escMAX1:=' '; escMAX2:= ' '; PigualI:=0; DaireauxPI:=0;
    LeerDatosP (proyecto);
    
    while (proyecto.code <> -1) do begin              
        cantescuelasT:=cantescuelasT+1;
        locACT:=proyecto.localidad;
        cantACT:=0;
        DobleMasAlumnos (aluMAX1,aluMAX2,escMAX1,escMAX2,proyecto.cantALU,proyecto.escuela);
        while (proyecto.localidad=locACT) do begin      
            cantACT:=cantACT+1;
            if (proyecto.localidad='Daireaux') then
                ParesImpares (proyecto.cantALU,PigualI);
            LeerDatosP (proyecto);
        end;
        writeln('La cantidad de escuelas participantes de la localidad ',locACT,' es de ',cantACT,'.');
    end;
    DaireauxPI:=PigualI;
    writeln('La cantidad de escuelas participantes total es de ',cantescuelasT,'.');
    writeln('La cantidad de escuelas de Daireaux con cantidad de alumnos que tienen igual cantidad de digitos pares e impares es de ',DaireauxPI,'.');
    writeln('Las escuelas con más alumnos participantes son ',escMAX1,' y ',escMAX2,'.');
end.