program Ejercicio4;


procedure leerDatos(var legajo: integer; var salario : real);
    begin
        writeln('Ingrese el nro de legajo y el salario');
        read(legajo);
        read(salario);
    end;


procedure actualizarMaximo (nuevoLegajo:integer; nuevoSalario:real; var maxLegajo:integer; var maxSalario:real);
    begin
        if (nuevoLegajo > maxLegajo) then begin
            maxLegajo:= nuevoLegajo;
            maxSalario := nuevoSalario
        end;
    end;


var
    legajo, maxLegajo, i : integer;
    salario, maxSalario,sumaSalarios: real;
begin
    maxLegajo := 0;
    maxSalario := 0;
    sumaSalarios := 0;
    for i := 1 to 3 do begin
        leerDatos(legajo, salario);
        actualizarMaximo(legajo, salario, maxLegajo,maxSalario);
        sumaSalarios := sumaSalarios + salario;
    end;
    writeln('En todo el mes se gastan ', sumaSalarios:1:2,' pesos');
    writeln('El salario del empleado más nuevo es ',maxSalario:1:2,'.');
end.