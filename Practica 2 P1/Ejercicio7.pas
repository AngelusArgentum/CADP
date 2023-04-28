program Ejercicio7;
{7. Realizar un programa que lea desde teclado información de autos de carrera. Para cada uno de los
autos se lee el nombre del piloto y el tiempo total que le tomó finalizar la carrera. En la carrera
participaron 100 autos. Informar en pantalla:
- Los nombres de los dos pilotos que finalizaron en los dos primeros puestos.
- Los nombres de los dos pilotos que finalizaron en los dos últimos puestos.}
var
    Nombre,PRIMERO,SEGUNDO,ULTIMO,ANTEULTIMO:string;
    Tiempo,MEJOR1,MEJOR2,PEOR1,PEOR2:real;
    autos:integer;
begin
    PRIMERO:='und';
    SEGUNDO:='und';
    ULTIMO:='und';
    ANTEULTIMO:='und';
    MEJOR1:=32767;
    MEJOR2:=32767;
    PEOR1:=-1;
    PEOR2:=-1;
    for autos:= 1 to 5 do begin
        write('Ingrese el nombre del corredor: ');readln(Nombre);
        write('Ingrese su tiempo de finalización: ');readln(Tiempo);
        if (Tiempo<MEJOR1) then begin
            MEJOR2:=MEJOR1; 
            MEJOR1:=Tiempo;
            SEGUNDO:=PRIMERO; 
            PRIMERO:=Nombre;
        end
        else if (Tiempo<MEJOR2) then begin
            PEOR2:=MEJOR2; 
            MEJOR2:=Tiempo; 
            ANTEULTIMO:=SEGUNDO;
            SEGUNDO:=Nombre;
        end;
        if (Tiempo>PEOR1) then begin
            PEOR2:=PEOR1;
            PEOR1:=Tiempo;
            ANTEULTIMO:=ULTIMO;
            ULTIMO:=Nombre;
        end
        else if (Tiempo>PEOR2) then begin
            PEOR2:=Tiempo;
            ANTEULTIMO:=Nombre;
        end;
    end;
    writeln('El primero y el segundo fueron respectivamente: : ',PRIMERO,' y ',SEGUNDO,'.');
    writeln('El anteúltimo y el último fueron respectivamente : ',ANTEULTIMO,' y ',ULTIMO,'.');
end.