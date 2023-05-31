Program Ejercicio5;
{5. Realizar un programa que lea información de autos que están a la venta en una concesionaria. De cada auto se lee:
marca, modelo y precio. La lectura finaliza cuando se ingresa la marca “ZZZ” que no debe procesarse. La
información se ingresa ordenada por marca. Se pide calcular e informar:
a. El precio promedio por marca.
b. Marca y modelo del auto más caro.}
{~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~}

type
    autos=record
        marca:string;
        modelo:string;
        precio:real;
    end;

{~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~}

Procedure LeerDatos (var A:autos); {Lee los datos del auto, si lee la marca ZZZ no pide los datos siguientes.}
begin
    with A do begin
        write ('Ingrese la marca del auto: '); readln (marca);
        if (marca<>'ZZZ') then begin
            write ('Ingrese el modelo del auto: '); readln (modelo);
            write ('Ingrese el precio del auto: '); readln (precio);
        end;
    end;
end;

Procedure AutoMasCaro (A:autos; var modeloMAX:string ; var marcaMAX:string ; var precioMAX:real);
begin
    if (A.precio>precioMAX) then begin
        modeloMAX:=A.modelo;
        marcaMAX:=A.marca;
        precioMAX:=A.precio;
    end;
end;

{~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~}

var
    auto:autos;
    modeloMAX,marcaMAX,marcaACT:string;
    precioMAX,preciototal:real;
    cant:integer;
begin
    modeloMAX:=' '; marcaMAX:=' ';precioMAX:=-1;
    LeerDatos (auto);
    while (auto.marca <> 'ZZZ') do begin
        marcaACT:=auto.marca;
        cant:=0;
        preciototal:=0;
        AutoMasCaro (auto,modeloMAX,marcaMAX,precioMAX);
        while (marcaACT=auto.marca) do begin
            cant:=cant+1;
            preciototal:=preciototal+auto.precio;
            LeerDatos (auto);
        end;
        writeln('El promedio del valor de los autos de marca ',marcaACT,' es de $',preciototal/cant:0:2,'.');
    end;
    writeln('El auto más caro es respectivamente de modelo y marca ',modeloMAX,' y ',marcaMAX,'.');
end.