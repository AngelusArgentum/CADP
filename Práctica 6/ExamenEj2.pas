Program ParcialEj2; //NO EXISTE ParcialEJ1 PORQUE SE CORTO LA LUZ Y LO PERDÍ.
{Una panaderia artesanal de La Plata vende productos de elaboracion propia. 
La panaderia agrupa sus productos en 26 categorias. 
Cada categoria se conoce nombre y precio por kilo de producto.

La panaderia dispone de informacion de todas las compras realizadas en el ultimo año. 
De cada compra se conoce el DNI del cliente, la categoría del producto (1-26) y la cantidad de kilos comprados. 
La informacion se encuentra ordenada por DNI del cliente.

a) realizar un modulo que retorne la informacion de las categorias en una estructura de datos adecuada
La informacion se lee por teclado sin ningun orden. 
De cada categoria se lee nombre, codigo (1-26) y precio x kilo.}

const
    cant_categorias=26;
type
    rango_categorias=1..cant_categorias;
    producto=record
        nombre:string;
        pxKG:real;
    end;
    
    Vproductos=array [1..cant_categorias] of producto;
    
    compra=record
        DNI:integer;
        categoria:rango_categorias;
        KGcomprados:real;
    end;
    
    lista=^nodo;
    nodo=record
        dato:compra;
        sig:lista;
    end;
    
    Vmontos=array [rango_categorias] of real;
    
Procedure LeerProducto (var C:rango_categorias; var P:producto);
begin
    with P do begin
        readln(nombre);
        readln(pxKG);
    end;
    readln (C);
   
Procedure CargarProductos (var v:Vproductos);
var
    P:producto;
    i:integer;
    c:rango_categorias;
begin
    for i:=1 to cant_categorias do begin
        LeerProducto(P,C);
        v[C]:=P;
end;

{b)Realizar un modulo que reciba la informacion de todas las compras, la informacion de las categorías y retorne:
1- DNI del cliente que mas compras ha realizado.
2-Monto total recaudado por cada categoria
3-Cantidad total de compras de clientes con DNI compuesto por al menos 3 digitos pares.}
Procedure InicializarVector (var m:montos);
var
    i:rango_categorias;
begin
    for i:=1 to cant_categorias do begin
        m[i]:=0;
end;

Function DNI3DigPar (DNI:integer):boolean;
var
    tiene:boolean;
    digito:integer;
    contador:integer;
begin
    contador:=0;
    while (DNI<>0) do begin
        digito:=DNI MOD 10;
        if (digito MOD 2=0) then
            contador:=contador+1;
    end;
    tiene:=(contador>=3);
    DNI3DigPar:=tiene;
end;


Procedure ActualizarMax (ComprasACT,DNIACT:integer; var ComprasMAX,DNIMAX:integer);
begin
    if ComprasACT>ComprasMAX then begin
        ComprasMAX:=ComprasACT;
        DNIMAX:=DNIACT;
    end;
end;


Procedure RecorrerLista (L:lista; v:Vproductos var DNIMAX:integer; var m:Vmontos; var comDNI3:integer);
var
    ComprasMAX:integer;
    DNIACT,DNIMAX:integer;
    ComprasACT:integer;
begin
    ComprasMAX:=0;
    comDNI3:=0;
    InicializarVector(m);
    while (L <> NIL) do begin
        DNIACT:=L^.dato.DNI;
        ComprasACT:=0;
        while (L <> NIL) AND (DNIACT=L^.dato.DNI) do begin
            ComprasACT:=ComprasACT+1;
            m[L^.dato.categoria]:=m[L^.dato.categoria]+L^.dato.KGcomprados*v[L^.dato.categoria].pxKG;
            if (DNI3DigPar(L^.dato.DNI)) then
                comDNI3:=comDNI3+1;
            L:=L^.sig;
        end;
        ActualizarMax(ComprasACT,DNIACT,ComprasMAX,DNIMAX);
    end;
end;

var
    v:Vproductos;
    L:lista;
    DNIMAX:integer;
    m:Vmontos;
    comDNI3:integer;
    
begin
    CargarLista(L) //Se dispone, se enviaría por referencia para que se reflejen las modificaciones.
    CargarProductos(v); //Inciso A
    RecorrerLista (L,v,DNIMAX,m,comDNI3); //IncisoB