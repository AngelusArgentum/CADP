Program Modulos;

Procedure Eliminar (var pri:lista; n: integer);  {Elimina el enlace con la posicion de memoria que (lista desordenada)}
var                                                                   {contiene el elemento dado y rehace las conexiones.}         
    actual,anterior:lista;
begin
    actual:=pri;
    anterior:=nil;
    
    while (actual <> nil) AND (actual^.num <> n) do begin
        anterior:=actual;
        actual:=actual^.sig;
    end;
    
    if (actual <> nil) then
        if (actual=pri) then
            pri:=actual^.sig;
        else
            anterior^.sig:=actual^.sig;
    dispose (actual);
end;

Procedure EliminarOrdenadoAsc (var pri:lista; n: integer); //Lista ordenada de manera ascendente. Para descendente voltear el unico comparador en linea 31.
var
    actual,anterior:lista;
begin
    actual:=pri;
    anterior:=nil;

    // Buscar el elemento a eliminar en la lista ordenada.
    while (actual <> nil) AND (actual^.num < n) do begin
        anterior:=actual;
        actual:=actual^.sig;
    end;

    // Verificar si se encontró el elemento y realizar la eliminación.
    if (actual <> nil) and (actual^.num = n) then begin
        // Si el elemento a eliminar es el primer nodo.
        if (actual = pri) then
            pri:=actual^.sig
        else
            anterior^.sig:=actual^.sig;
        dispose(actual);
    end;
end;

Procedure AgPrincipio (var pri,ult:lista ; n:integer);
var
    AUX:lista;
begin
    new(AUX);
    AUX^.num:=n;
    AUX^.sig:=nil;
    if (pri=nil) then begin
        pri:=AUX;
        ult:=AUX
    end
    else begin
        AUX^.sig:=pri;
        pri:=AUX
    end;
end;

Procedure AgFinal (var pri,ult:lista ; n integer);
var
    AUX:lista;
begin
    new(AUX);
    AUX^.num:=n;
    AUX^.sig:=nil;
    if (pri=NIL) then begin
        pri:=AUX;
        ult:=AUX
    end
    else begin
        ult^.sig:=AUX;
        ult:=AUX
    end;
end;

Function BuscarDesordenada(pri:lista;n:integer):boolean;
var
    esta:boolean;
begin
    esta:=false;
    while (pri<>nil) AND (esta=false) do
        if (pri^.num=n) then
            esta:=true
        else
            pri:=pri^.sig;
    BuscarDesordenada:=esta;
end;

Function BuscarOrdAsc (pri:lista; n:integer):boolean;
var
    esta:boolean;
begin
    esta:=false;
    while (pri<>NIL) AND (pri^.num < n) do
        pri:=pri^.sig;
    if (pri <> NIL) and (pri^.num = n) then
        esta:=true;
    BuscarOrdAsc:=esta;
end;

Function BuscarOrdDesc (pri:lista, n:integer):boolean;
var
    esta:boolean;
begin
    esta:=false;
    while (pri <> NIL) AND (pri^.num > n) do
        pri:=pri^.sig;
    if (pri <> NIL) AND (pri^.num = n) then
        esta:=true;
    BuscarOrdDesc:=esta;
end;

Procedure OrdXSelAsc (var v:vector ; DL:integer);
var
    i,j,p,item:integer;
begin
    for i:=1 to DL-1 do begin
        p:=i;
        for j:=i+1 to DL do
            if (v[j] < v[p]) then
                p:=j;
        item:=v[p];
        v[p]:=v[i];
        v[i]:=item;
    end;
end;

Procedure EliminarRepDesord (var pri:lista ; n: integer);
var
    anterior,actual:lista;
begin
    actual:=pri;
    anterior:=nil;
    while (actual <> nil) do
        if (actual^.num <> n) then begin
            anterior:=actual;
            actual:=actual^.sig
        end
        else begin
            if (actual=pri) then
                pri:=actual^.sig
            else
                anterior^.sig:=actual^.sig;
            dispose (actual);
            actual:=anterior;
        end;
end;


Procedure EliminarRepAsc (var pri:lista ; n: integer);
var
    anterior,actual:lista;
begin
    actual:=pri;
    anterior:=nil;
    while (actual <> nil) and (actual^.num < n) do begin
        anterior := actual;
        actual := actual^.sig;
    end;
    while (actual <> nil) and (actual^.num = n) do begin
        if (actual = pri) then
            pri := actual^.sig
        else
            anterior^.sig := actual^.sig;
        dispose(actual);
        actual := anterior^.sig;
    end;
end;