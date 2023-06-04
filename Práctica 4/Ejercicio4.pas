Program Ejercicio4;
{4. Se dispone de un vector con 10 números enteros. Implementar los siguientes módulos:

a) posicion: dado un número X y el vector de números, retorna la posición del número X en dicho vector,
o el valor -1 en caso de no encontrarse.

b) intercambio: recibe dos valores x e y (entre 1 y 10) y el vector de números, y retorna el mismo vector
donde se intercambiaron los valores de las posiciones x e y.

c) sumaVector: retorna la suma de todos los elementos del vector.

d) promedio: devuelve el valor promedio de los elementos del vector.

e) elementoMaximo: retorna la posición del mayor elemento del vector

f) elementoMinimo: retorna la posicion del menor elemento del vector}

const
    DF=10;
type
    vector=array [1..DF] of integer;

Function Pos (v:vector;X:integer):integer;
var
    AUX,i:integer;
begin
    for i:=1 to DF do begin
        if v[i]=X then
            Pos:=i;
        else
            Pos:=-1;
    end;
end;