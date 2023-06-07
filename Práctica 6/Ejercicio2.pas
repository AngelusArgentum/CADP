program ejercicio2;
type
    lista = ^nodo;
    
    persona = record
        dni: integer;
        nombre: string;
        apellido: string;
    end;
    
    nodo = record
        dato: persona;
        sig: lista;
    end;

procedure leerPersona(var p: persona);
begin
    write('Ingrese el DNI: ');readln(p.dni);
    if (p.dni <> 0)then begin
        write('Ingrese el nombre: '); readln(p.nombre);
        write('Ingrese el apellido: '); readln(p.apellido);
    end;
end;

procedure agregarAdelante(var l:lista ; p:persona);
var
    aux: lista;
begin
    new(aux);
    aux^.dato:= p;
    aux^.sig:= l;
    l:= aux;
end;

procedure generarLista (var l:lista);
var
    p:persona;
begin
    leerPersona(p);
    while (p.dni <> 0) do begin
        agregarAdelante(l,p);
        leerPersona(p);
    end;
end;

procedure imprimirInformacion(l:lista);
begin
    while (l <> nil) do begin
        writeln('-DNI: ', l^.dato.dni, ' -Nombre:',l^.dato.nombre, ' -Apellido:', l^.dato.apellido);
        l:= l^.sig;
    end;
end;

var
    l:lista;
begin
    generarLista(l);
    imprimirInformacion(l);
end.