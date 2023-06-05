Program Ejercicio3;
{3. Una empresa de transporte de caudales desea optimizar el servicio que brinda a sus clientes. Para ello,
cuenta con información sobre todos los viajes realizados durante el mes de marzo. De cada viaje se cuenta
con la siguiente información: día del mes (de 1 a 31), monto de dinero transportado y distancia recorrida
por el camión (medida en kilómetros).

a. Realizar un programa que lea y almacene la información de los viajes (a lo sumo 10). La lectura finaliza
cuando se ingresa una distancia recorrida igual a 0 km, que no debe procesarse.

b. Realizar un módulo que reciba el vector generado en a) e informe:
- El monto promedio transportado de los viajes realizados
- La distancia recorrida y el día del mes en que se realizó el viaje que transportó menos dinero.
- La cantidad de viajes realizados cada día del mes.

c. Realizar un módulo que reciba el vector generado en a) y elimine todos los viajes cuya distancia
recorrida sea igual a 100 km.

NOTA: para realizar el inciso b, el vector debe recorrerse una única vez.}

const
    DF=3;
type
    diames=1..31;
    
    viaje=record
        dia:diames;
        dinero:real;
        distancia:real;
    end;
    
    marzo=array [1..DF] of viaje;
    
    viajespordia=array [diames] of integer;

Procedure CargarViaje (var v:viaje);
begin
    with v do begin
        write('Ingrese la distancia recorrida en el viaje: ');readln(distancia);
        if (distancia<>0) then begin
            write('Ingrese el día en el que inició el viaje: ');readln(dia);
            write('Ingrese el dinero que se llevó al viaje: ');readln(dinero)
        end;
    end;
end;

Procedure CargarMarzo (var m:marzo; var DL:integer);
var
    v:viaje;
begin
    DL:=0;
    CargarViaje(v);
    while (DL<DF) AND (v.distancia<>0) do begin
        DL:=DL+1;
        m[DL]:=v;
        CargarViaje(v);
    end;
    writeln('Arreglo cargado con una dimensión lógica de ',DL,'.');
end;

Procedure MinimoDinero (m:marzo;i:integer;var disMIN:real;var diaMIN:integer; var dinMIN:real);
begin
    if (m[i].dinero<dinMIN) then begin
        disMIN:=m[i].distancia;
        diaMIN:=m[i].dia;
        dinMIN:=m[i].dinero;
    end;
end;

Procedure ViajesCadaDia(m:marzo ; i:integer ; var c:viajespordia);
var
    dia:integer;
begin
    dia:=m[i].dia;
    c[dia]:=c[dia]+1;
end;

Procedure InicializarContador (var c:viajespordia);
var
    i:integer;
begin
    for i:=1 to 31 do
        c[i]:=0;
end;
    
Procedure IncisoB (m:marzo;DL:integer);
var
    i:integer;
    disMIN,suma,promedio,dinMIN:real;
    diaMIN:integer;
    contador:viajespordia;
begin
    suma:=0;
    dinMIN:=9999;
    i:=1;
    InicializarContador (contador);
    for i:=1 to DL do begin
        suma:=suma+m[i].dinero;
        MinimoDinero(m,i,disMIN,diaMIN,dinMIN);
        ViajesCadaDia(m,i,contador);
    end;
    promedio:=suma/DL;
    writeln('El día que en el que se realizó el viaje que llevaba menos dinero es el ',diaMIN,' en el que se recorrió la distancia de ',disMIN:0:2,'km.');
    writeln('El promedio de dinero llevado en los viajes fue de $',promedio:0:2,'.');
    for i:=1 to 31 do
        writeln('El día ',i,' hubo un total de ',contador[i],' viajes.');
end;

Procedure IncisoC (m:marzo;var DL:integer);

var
    m:marzo;
    DL:integer;
begin
    CargarMarzo (m,DL);
    IncisoB (m,DL);
end.