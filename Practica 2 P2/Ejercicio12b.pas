Program Ejercicio12b;
{Para calcular el rendimiento económico esperado debe considerar el siguiente rendimiento por tipo de zona:
|1->6 tonaleadas por ha.
|2->2.6 toneladas por ha.
|3->1.4 toneladas por ha.

b. ARBA desea procesar información obtenida de imágenes satelitales de campos sembrados con soja en la
provincia de Buenos Aires. 

De cada campo se lee: localidad, cantidad de hectáreas sembradas y el tipo de zona (1, 2 ó 3). 

La lectura finaliza al leer un campo de 900 ha en la localidad ‘Saladillo’, que debe procesarse. 

El precio de la soja es de U$S320 por tn. 

Informar:
● La cantidad de campos de la localidad Tres de Febrero con rendimiento estimado superior a U$S 10.000.
● La localidad del campo con mayor rendimiento económico esperado.
● La localidad del campo con menor rendimiento económico esperado.
● El rendimiento económico promedio.}
const
    valorXton=320;
type
    zona=1..3;
Procedure RenEco (var ha,renTotal,Rendimiento:real;var tipo:zona;var localidad:string;valorXton:real;var CamposLeidos:integer);
begin
    writeln('Ingrese la cantidad de hectáreas sembradas: ');readln(ha);
    writeln('Ingrese la localidad: ');readln(localidad);
    writeln('Ingrese el tipo de zona: ');
    writeln('1: Muy fertil.');
    writeln('2: Estándar.');
    writeln('3: Árida.');
    readln(tipo);
    Rendimiento:=0;
    case tipo of
        1: Rendimiento:=6*ha*valorXton;
        2: Rendimiento:=2.6*ha*valorXton;
        3: Rendimiento:=1.4*ha*valorXton;
    end;
    if (Rendimiento<>0) then begin
        writeln('El rendimiento económico de la plantación de ',localidad,' es de U$S',Rendimiento:1:2,'.');
        renTotal:=renTotal+Rendimiento;
        CamposLeidos:=CamposLeidos+1
    end
    else
        writeln('El tipo de zona ingresada era inválida.')
end;

Function Max (var renMax:real ; var locMax:string ; Rendimiento:real ; localidad:string ; tipo:zona):string;
begin
    if (tipo=1) OR (tipo=2) OR (tipo=3) then
        if (Rendimiento>renMax) then begin
            renMax:=Rendimiento;
            locMax:=localidad;
        end;
    Max:=LocMax;
end;


Function Min (var renMin:real; var locMin:string ; Rendimiento:real ; localidad:string; tipo:zona):string;
begin
    if (tipo=1) OR (tipo=2) OR (tipo=3) then
        if (Rendimiento<renMin) then begin
            renMin:=Rendimiento;
            locMin:=localidad;
        end;
    Min:=LocMin;
end;


var
    ha,renMin,renMax,renTotal,Rendimiento:real;
    tipo:zona;
    localidad,locMin,LocMax:string;
    CamposLeidos:integer;
begin
    CamposLeidos:=0; renMin:=99999; renMax:=-1; locMin:='und'; locMax:='und'; renTotal:=0; Rendimiento:=0;
    repeat
    RenEco (ha, renTotal, Rendimiento, tipo, localidad, valorXton, CamposLeidos);
    Max (renMax, locMax, Rendimiento, localidad, tipo);
    Min (renMin, locMin, Rendimiento, localidad, tipo);
    until (ha=900) AND (localidad='Saladillo');
    writeln('Campo con el rendimiento estimado máximo: ',Max (renMax, locMax, Rendimiento, localidad, tipo),'.');
    writeln('Campo con el rendimiento estimado mínimo: ',Min (renMin, locMin, Rendimiento, localidad, tipo),'.');
    writeln('Promedio: ',renTotal/CamposLeidos:1:2);
end.