Program Ejercicio5;
{5. Realizar un programa que lea y almacene la información de productos de un supermercado. De cada
producto se lee: código, descripción, stock actual, stock mínimo y precio. La lectura finaliza cuando se ingresa
el código -1, que no debe procesarse. Una vez leída y almacenada toda la información, calcular e informar:}

type
    producto=record
        code:integer;
        {descripción:string;}
        stockACT:integer;
        stockMIN:integer;
        precio:real;
    end;
    
    lista_productos=^nodo;
    
    nodo=record
        dato:producto;
        sig:lista_productos;
    end;

Procedure CrearLista (var pri,ult:lista_productos);
begin
    pri:=NIL;
    ult:=NIL;
end;

Procedure LeerProducto (var p:producto);
begin
    write('Ingrese el código del producto: ');readln(p.code);
    if (p.code <> -1) then begin
        write('Ingrese el stock actual del producto: ');readln(p.stockACT);
        write('Ingrese el stock minimo del producto: ');readln(p.stockMIN);
        write('Ingrese el precio del producto: ');readln(p.precio);
    end;
end;

Procedure AgregarAtras (var pri,ult:lista_productos);
var
    AUX:lista_productos;
    p:producto;
begin
    LeerProducto(p);
    while (p.code <> -1) do begin
        new(AUX);
        AUX^.dato:=p;
        AUX^.sig:=NIL;
        if (pri=NIL) then begin
            pri:=AUX;
            ult:=AUX
        end
        else begin
            ult^.sig:=AUX;
            ult:=AUX
        end;
        LeerProducto(p);
    end;
end;

{a. Porcentaje de productos con stock actual por debajo de su stock mínimo.}
Procedure CalcPorc (pri:lista_productos;var TotP,TotPStockBajo:integer);
begin
    TotP:=TotP+1;
    if (pri^.dato.stockACT < pri^.dato.stockMIN) then
            TotPStockBajo:=TotPStockBajo+1;
end;

{b. Precio de aquellos productos con código compuesto por al menos tres dígitos pares.}
Procedure PrecioCODE3DigPar (pri:lista_productos);
var
    DigPares:integer;
    codigo:integer;
    Digito:integer;
begin
    DigPares:=0;
    codigo:=pri^.dato.code;
    while (codigo <> 0) do begin
        Digito:=codigo MOD 10;
            if (Digito MOD 2 = 0) then
                DigPares:=DigPares+1;
        codigo:= codigo DIV 10;
    end;
    if (DigPares>=3) then
        writeln('El producto de precio ',pri^.dato.precio:0:2,' tiene 3 o más digitos pares.');
end;

{c. Código de los dos productos más económicos.}
Procedure DosBaratos (pri:lista_productos; var pMIN1,pMIN2:real; var cMIN1,cMIN2:integer);
var
    codigo:integer;
    precio:real;
begin
    codigo:=pri^.dato.code;
    precio:=pri^.dato.precio;
    if (precio < pMIN1) then begin
        pMIN2:=pMIN1;
        cMIN2:=cMIN1;
        pMIN1:=precio;
        cMIN1:=codigo
    end
    else if (precio < pMIN2) then begin
        pMIN2:=precio;
        cMIN2:=codigo
    end;
end;

Procedure RecorrerYCalcular (pri:lista_productos);
var
    Porcentaje:real;
    TotP,TotPStockBajo:integer;
    codeMIN1,codeMIN2:integer;
    precioMIN1,precioMIN2:real;
begin
    precioMIN1:=9999;
    precioMIN2:=9999;
    Porcentaje:=0;
    TotP:=0;
    TotPStockBajo:=0;
    while (pri <> NIL) do begin
        CalcPorc(pri,TotP,TotPStockBajo);
        PrecioCODE3DigPar(pri);
        DosBaratos(pri,precioMIN1,precioMIN2,codeMIN1,codeMIN2);
        
        pri:=pri^.sig;
    end;
    Porcentaje:=(TotPStockBajo/TotP)*100;
    writeln ('El porcentaje de productos con stock actual menor al mínimo es de: ',Porcentaje:0:2,'%.');
    writeln ('Los códigos de los productos más baratos son: ',codeMIN1,' y ',codeMIN2,'.');
end;

var
    pri,ult:lista_productos;
begin
    CrearLista(pri,ult);
    AgregarAtras(pri,ult);
    RecorrerYCalcular(pri);
end.