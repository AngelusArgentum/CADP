Program Ejercicio12a;
{12. 
a. Realizar un módulo que calcule el rendimiento económico de una plantación de soja. 

El módulo debe recibir:

|| La cantidad de hectáreas (ha) sembradas,
|| El tipo de zona de siembra (1: zona muy fértil, 2: zona estándar, 3: zona árida)
|| El precio en U$S de la tonelada de soja.

El módulo debe devolver el rendimiento económico esperado de dicha plantación. 

Para calcular el rendimiento económico esperado debe considerar el siguiente rendimiento por tipo de zona:
|1->6 tonaleadas por ha.
|2->2.6 toneladas por ha.
|3->1.4 toneladas por ha.}
type
    zona=1..3;
Procedure RenEco (var ha:real;var tipo:zona;var valorXton:real);
var
    Rendimiento:real;
begin
    writeln('Ingrese la cantidad de hectáreas sembradas: ');readln(ha);
    writeln('Indique el valor de la tonelada de soja en dólares.'); readln(valorXton);
    writeln('Ingrese el tipo de zona: ');
    writeln('1: Muy fertil.');
    writeln('2: Estándar.');
    writeln('3: Árida.');
    readln(tipo);
    Rendimiento:=0;
    case tipo of
        1: Rendimiento:=6*ha*valorXton;
        2: Rendimiento:=2.6*ha*valorXton;
        3: Rendimiento:=1.4*ha*valorXton;
    end;
    if (Rendimiento<>0) then
        writeln('El rendimiento económico de la plantación es de U$S',Rendimiento:1:2,'.')
    else
        writeln('El tipo de zona ingresada era inválida.')
end;

var
    ha,valorXton:real;
    tipo:zona;
begin
    RenEco(ha,tipo,valorXton);
end.