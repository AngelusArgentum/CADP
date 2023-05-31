{Leer datos de perros, raza, nombre, edad, ultima visita (fecha) y determinar cuántos perros se atendieron entre los primeros
15 días de enero o febrero de 2023. Informar}
Program perrox;

type
    fecha = record
        dia:integer;
        mes:integer;
        ano:integer;
    end;
    perro = record
        nombre:string;
        raza:string;
        edad:integer;
        FechaVis:fecha;
    end;


Procedure LeerFecha (var f:fecha);
    begin
        with f do begin
            writeln('Ingrese la fecha de la última visita (D/M/A)');
            write ('Ingrese el dia de la última visita: '); readln(dia);
            write ('Ingrese el mes de la última visita: '); readln (mes);
            write ('Ingrese el año de la última visita: '); readln(ano);
        end;
    end;


Procedure LeerPerro (var p:perro);
    begin
        write ('Ingrese el nombre del perro: '); readln (p.nombre);
        write ('Ingrese la raza del perro: '); readln (p.raza);
        write ('Ingrese la edad del perro: '); readln (p.edad);
        LeerFecha (p.FechaVis);
    end;


Function CumpleFecha (p:perro):boolean;
    begin
        CumpleFecha:= (((p.FechaVis.dia >= 1) AND (p.FechaVis.dia <=15)) AND
        ((p.FechaVis.mes = 1) OR (p.FechaVis.mes = 2)) AND 
        (p.FechaVis.ano = 2023))
    end;

var
    animal:perro;
    cant,i:integer;
begin
    cant:=0;
    for i:= 1 to 3 do begin
        LeerPerro (animal);
        if (CumpleFecha(animal)) then
            cant:=cant+1
    end;
    writeln ('La cantidad de perros que cumplen las condiciones es de ',cant,'.');
end.