Program Ejercicio3;
type

lista=^nodo;

nodo=record
    num:integer;
    sig:lista;
end;

{a. Modificar el módulo armarNodo para que los elementos se guarden en la lista en el orden en que fueron
ingresados (agregar atrás).}
{b. Modificar el módulo armarNodo para que los elementos se guarden en la lista en el orden en que fueron
ingresados, manteniendo un puntero al último ingresado.}
procedure AgregarAtras (var pri,ult: lista; v: integer);
var
    AUX:lista;
begin
    new(AUX);
    AUX^.num:=v;
    AUX^.sig:=NIL;
    if (pri=NIL) then
        pri:=AUX;
        ult:=AUX
    end
    else begin
        ult^.sig:=AUX;
        ult:=AUX
    end;
end;

{Ejemplo de Agregar Adelante}
AgregarAdelante (var pri,ult:lista; v:integer);
var
    AUX:lista;
begin 
    new(AUX);
    AUX^.num:=v;
    AUX^.sig:=NIL;
    if (pri=NIL) then begin
        pri:=AUX;
        ult:=AUX
    end
    else begin
        AUX^sig:=pri;
        pri:=AUX
    end;
end;

var
    PRIMERO,ULTIMO:lista;
    N:integer;
begin
    write('Ingrese un valor para agregar a la lista: '); readln(N)
    AgregarAdelante(PRIMERO,ULTIMO,N);
    AgregarAtras(PRIMERO,ULTIMO,N);
end.