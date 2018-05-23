function id = generarID(idlist)
%% Implementaci?n para generar los id de 32 d?gitos hexadecimales como en la base de datos de pacientes.
% idlist es la lista de los ID que ya existen en la base de datos.
hexa = round(1 + (16-1).*rand(32,1)); % Valores aleatorios de hexa;
id = '';
hexdigits = ['0' '1' '2' '3' '4' '5' '6' '7' '8' '9' 'A' 'B' 'C' 'E' 'D' 'F']; % digitos hexa para concadenar
for i = 1:32
    id = strcat(id, hexdigits(hexa(i))); %agrega el valor en hexa debido a ID.
    if(i == 8 || i == 12 || i == 16 || i == 20) % agregas los dash a los id en los indices como est? en las bases de datos
        id =strcat(id, '-');
    end
end
% Recorrido para verificar si el c?digo ya existe. En el peor caso
% complejidad Log(n). JAMES ESTO ES MENTIRA, ES O(N).
repeated = 0;
for j = 1:length(idlist)
    if(strcmp(id,idlist(j)))
        repeated=1;
        break;
    end
end
% Peque?a recursi?n para generar un nuevo c?digo en caso de que exista.
if(repeated==1)
    id = generarID(idlist);
end
