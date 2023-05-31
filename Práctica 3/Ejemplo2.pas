{Se lee informacion de gatos: raza, nombre, edad. 
Se lee hasta encontrar el nombre "X".
Indicar de qué raza había más gatos y el total de gatos.}
Program gatitos;

type
    gatos = record
        raza:string;
        nombre:string;
        edad:integer;
    end;


Procedure LeerGato (var g:gatos);
    begin
        with g do begin
            write ('Ingrese el nombre del gato: '); readln (nombre);
            write ('Ingrese la raza del gato: '); readln (raza);
            write ('Ingrese la edad del gato: '); readln (edad);
        end;
    end;

var
    gatito:gatos;
    cant:integer;
    total:integer;
    razaact:string;
    max:integer;
    razamax:string;
begin
    max:= -1; razamax:= ' '; total:=0;
    LeerGato (gatito);
    while (gatito.raza <> 'X') do begin
        cant:=0; razaact:=gatito.raza;
        while ((gatito.raza <> 'X') AND (gatito.raza=razaact)) do begin
            cant:=cant+1;
            LeerGato(gatito);
        end;
        if (cant>max) then begin
            max:=cant;
            razamax:=razaact;
        end;
        total:=total+cant;
        writeln ('La cantidad de gatos de la raza ',razaact,' es de ',cant,'.');
    end;
    writeln ('La cantidad total de gatos es de ',total,'.');
    writeln ('La raza con mayor cantidad de gatos es "',razamax,'".');
end.