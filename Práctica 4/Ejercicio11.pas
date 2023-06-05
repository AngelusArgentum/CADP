Program Ejercicio11;
{11. El colectivo de fotógrafos ArgenPics desea conocer los gustos de sus seguidores en las redes sociales. Para
ello, para cada una de las 200 fotos publicadas en su página de Facebook, cuenta con la siguiente
información: título de la foto, el autor de la foto, cantidad de Me gusta, cantidad de clics y cantidad de
comentarios de usuarios. Realizar un programa que lea y almacene esta información. Una vez finalizada la
lectura, el programa debe procesar los datos e informar:

a) Título de la foto más vista (la que posee mayor cantidad de clics).

b) Cantidad total de Me gusta recibidas a las fotos cuyo autor es el fotógrafo “Art Vandelay”.

c) Cantidad de comentarios recibidos para cada una de las fotos publicadas en esa página.}
const
    DF=3;
type
    fotos=record
        titulo:string;
        autor:string;
        likes:longint;
        clicks:longint;
        comments:longint;
    end;

    vector=array [1..DF] of fotos;

Procedure CargarV (var v:vector);
var
    i:integer;
begin    
    for i:=1 to DF do
        with v[i] do begin
            write('Ingrese el título de la foto: ');readln(titulo);
            write('Ingrese el autor de la foto: ');readln(autor);
            write('Ingrese la cantidad de likes de la foto: ');readln(likes);
            write('Ingrese la cantidad de clicks de la foto: ');readln(clicks);
            write('Ingrese la cantidad de comentarios de la foto: ');readln(comments);
            writeln('---------------------------------------------');
        end;
end;


Procedure FotoVista (v:vector; var cv:longint; var tv:string; i:integer);
begin
    if v[i].clicks>cv then begin
        cv:=v[i].clicks;
        tv:=v[i].titulo;
    end;
end;


Procedure TotalLikesAV (v:vector; var TAV:longint; i:integer);
begin
    if v[i].autor='Art Vandelay' then
        TAV:=TAV+v[i].likes;
end;


Procedure Comentarios (v:vector; var TC:longint; i:integer);
begin
    TC:=TC+v[i].comments;
end;

Procedure Informar (TC:longint; TAV:longint; tv:string);
begin
    writeln('La foto más vista lleva el título ',tv,'.');
    writeln('La cantidad de likes que recibió el autor Art Vandelay es de ',TAV,'.');
    writeln('En la página hay un total de ',TC,' comentarios.');
end;

var
    v:vector;
    totalAV,cv,Tcomments:longint;
    tv:string;
    i:integer;
begin
    Tcomments:=0;
    totalAV:=0;
    cv:=-1;
    CargarV(v);
    for i:= 1 to DF do begin
        FotoVista(v,cv,tv,i);
        TotalLikesAV(v,totalAV,i);
        Comentarios(v,Tcomments,i);
    end;
    Informar(Tcomments,totalAV,tv);
end.