program Ejercicio1;
type
    lista = ^nodo;
    nodo = record
        num : integer;
        sig : lista;
    end;

procedure armarNodo(var L: lista; v: integer);
var
    aux : lista;
begin
    new(aux);
    aux^.num := v;
    aux^.sig := L;
    L := aux;
end;

Procedure LeerLista (L:lista);
begin
    while (L<>NIL) do begin
        writeln(L^.num);
        L:=L^.sig;
    end;
end;

Procedure SumarDos (var L:lista);
var
    AUX:lista;
begin
    AUX:=L;
    while (AUX<>NIL) do begin
        AUX^.num:=AUX^.num+2;
        AUX:=AUX^.sig;
    end;
end;

var
    pri : lista;
    valor : integer;
begin
    pri := nil;
    writeln('Ingrese un numero');
    read(valor);
    while (valor <> 0) do begin
        armarNodo(pri, valor);
        writeln('Ingrese un numero');
        read(valor);
    end;
    LeerLista (pri);
    SumarDos(pri);
    LeerLista(pri);
    SumarDos(pri);
    LeerLista(pri);
end.
