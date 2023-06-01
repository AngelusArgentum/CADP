program Ejercicio8;
{8. Un local de ropa desea analizar las ventas realizadas en el último mes. Para ello se lee por cada día
del mes, los montos de las ventas realizadas. La lectura de montos para cada día finaliza cuando se
lee el monto 0. Se asume un mes de 31 días. Informar la cantidad de ventas por cada día, y el monto
total acumulado en ventas de todo el mes.
a. Modifique el ejercicio anterior para que además informe el día en el que se realizó la mayor
cantidad de ventas.}
var
    dia,VDM,VD,DiaM:integer;
    MontoM,Monto:real;
begin
    MontoM:=0; VDM:=0; VD:=0;
    for dia:=1 to 3 do begin
        write('Ingrese un monto: '); readln(Monto);
        while (Monto<>0) do begin
            VD:=VD+1;
            MontoM:=MontoM+Monto;
            write('Ingrese otro monto: '); readln(Monto);
        end;
        writeln('Se realizaron ',VD,' ventas el dia ',dia,'.');
        if (VD>VDM) then begin
            VDM:=VD;
            DiaM:=dia;
        end;
        VD:=0;
    end;
    writeln('Se acumularon un total de $',MontoM:1:2,' en el mes. El día con mayor cantidad de ventas fue el ',DiaM,' del mes.');
end.