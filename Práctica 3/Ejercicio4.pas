{ Una compañía de telefonía celular debe realizar la facturación mensual de sus 9300 clientes con planes de
consumo ilimitados (clientes que pagan por lo que consumen). Para cada cliente se conoce su código de cliente y
cantidad de líneas a su nombre. De cada línea se tiene el número de teléfono, la cantidad de minutos consumidos
y la cantidad de MB consumidos en el mes. Se pide implementar un programa que lea los datos de los clientes de
la compañía e informe el monto total a facturar para cada uno. Para ello, se requiere:
a. Realizar un módulo que lea la información de una línea de teléfono.
b. Realizar un módulo que reciba los datos de un cliente, lea la información de todas sus líneas (utilizando el
módulo desarrollado en el inciso a. ) y retorne el valor de la cantidad total de minutos y la cantidad total de MB a facturar
del cliente.
Nota: para realizar los cálculos tener en cuenta que cada minuto cuesta $3,40 y cada MB consumido cuesta $1,35.
}
Program Ejercicio4;

const
    Min=3.40;
    MB=1.35;

type
    lineas=record
        numero:string;
        minutos:integer;
        MBmes:real;
    end;

{-----------------------------------------------------------------------------------------------}

    cliente=record
        code:integer;
        cantlineas:integer;
    end;

{-----------------------------------------------------------------------------------------------}

Procedure LeerLinea (var L:lineas);
begin    
    with L do begin
        write ('Ingrese el número de teléfono: '); readln(numero);
        write ('Ingrese la cantidad de minutos utilizados: '); readln(minutos);
        write ('Ingrese la cantidad de MB consumidos en el mes: '); readln(MBmes);
    end;
end;

{-----------------------------------------------------------------------------------------------}

Procedure LeerCliente (var C:cliente);
begin
    with C do begin
        write ('Ingrese el código del cliente: '); readln (code);
        write ('Ingrese la cantidad de líneas del cliente: '); readln (cantlineas);
    end;
end;

{-----------------------------------------------------------------------------------------------}

Function Facturar (C:cliente;L:lineas):real;
var
    i:integer;
begin
    Facturar:=0;
    for i:= 1 to C.cantlineas do begin
        LeerLinea(L);
        Facturar:=Facturar+L.MBmes*MB+L.minutos*Min;
    end;
end;

{-----------------------------------------------------------------------------------------------}

var
    linea:lineas;
    i:integer;
    persona:cliente;
    totalfactura:real;
begin
    totalfactura:=0;
    for i:=1 to 9300 do begin
        LeerCliente (persona);
        totalfactura:= Facturar(persona,linea);
        writeln ('Al cliente de código ',persona.code,' se le deben facturar $',totalfactura:0:2,'.');
    end;
end.