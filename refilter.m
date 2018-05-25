function [lista, va] = refilter(entrylist, params)

list ={};
va = params;
if(strcmp(params(1), 'Name'))
    for i = 1:length(entrylist)
         ind = length(list)+1;
        if(strfind(entrylist{i,1},params{2}))
            list{ind, 1} = entrylist{i,1};
            list{ind, 2} = entrylist{i,2};
            list{ind, 3} = entrylist{i,3};
            list{ind, 4} = entrylist{i,4};
            list{ind, 5} = entrylist{i,5};
            list{ind, 6} = entrylist{i,6};
            list{ind, 7} = entrylist{i,7};
            list{ind, 8} = entrylist{i,8};
        end
    end
    if(length(list) >8)
        for j =2:8 
            % Fix de un error que se genera por como MatLab funciona, y deja N filas vac?as 
            % despu?s de la primera, donde N es el n?mero de Columnas menos 1.
            list(2,:)= []; % Borrar fila 2 ocho veces.
        end
    end
elseif(strcmp(params(1), 'Gender'))
    for i = 1:length(entrylist)
         ind = length(list)+1;
        if(strfind(entrylist{i,2},params{2}))
            list{ind, 1} = entrylist{i,1};
            list{ind, 2} = entrylist{i,2};
            list{ind, 3} = entrylist{i,3};
            list{ind, 4} = entrylist{i,4};
            list{ind, 5} = entrylist{i,5};
            list{ind, 6} = entrylist{i,6};
            list{ind, 7} = entrylist{i,7};
            list{ind, 8} = entrylist{i,8};
        end
    end
    if(length(list) >8)
        for j =2:8
             %Fix de un error que se genera por como MatLab funciona, y deja N filas vac?as 
            % despu?s de la primera, donde N es el n?mero de Columnas menos 1.
            list(2,:)= []; % Borrar fila 2 siete veces.
        end
    end
elseif(strcmp(params(1), 'BornBefore'))
    for i = 1:length(entrylist)
         ind = length(list)+1;
         pov = cellfun(@(s)s(1:4), entrylist(i,3),'UniformOutput',false);
        if(str2num(pov{i}) <= str2num(params{2}))
            list{ind, 1} = entrylist{i,1};
            list{ind, 2} = entrylist{i,2};
            list{ind, 3} = entrylist{i,3};
            list{ind, 4} = entrylist{i,4};
            list{ind, 5} = entrylist{i,5};
            list{ind, 6} = entrylist{i,6};
            list{ind, 7} = entrylist{i,7};
            list{ind, 8} = entrylist{i,8};
        end
    end
    if(length(list) >8)
        for j =2:8 
            % Fix de un error que se genera por como MatLab funciona, y deja N filas vac?as 
            % despu?s de la primera, donde N es el n?mero de Columnas menos 1.
            list(2,:)= []; % Borrar fila 2 ocho veces.
        end
    end
elseif(strcmp(params(1), 'BornAfter'))
    for i = 1:length(entrylist)
         ind = length(list)+1;
         pov = cellfun(@(s)s(1:4),entrylist(i,3),'UniformOutput',false);
        if(str2num(pov{i}) >= str2num(params{2}))
            list{ind, 1} = entrylist{i,1};
            list{ind, 2} = entrylist{i,2};
            list{ind, 3} = entrylist{i,3};
            list{ind, 4} = entrylist{i,4};
            list{ind, 5} = entrylist{i,5};
            list{ind, 6} = entrylist{i,6};
            list{ind, 7} = entrylist{i,7};
            list{ind, 8} = entrylist{i,8};
        end
    end
    if(length(list) >8)
        for j =2:8 
            % Fix de un error que se genera por como MatLab funciona, y deja N filas vac?as 
            % despu?s de la primera, donde N es el n?mero de Columnas menos 1.
            list(2,:)= []; % Borrar fila 2 ocho veces.
        end
    end
elseif(strcmp(params(1), 'Language'))
    for i = 1:length(entrylist)
         ind = length(list)+1;
         if(strfind(entrylist{i,6},params{2}))
            list{ind, 1} = entrylist{i,1};
            list{ind, 2} = entrylist{i,2};
            list{ind, 3} = entrylist{i,3};
            list{ind, 4} = entrylist{i,4};
            list{ind, 5} = entrylist{i,5};
            list{ind, 6} = entrylist{i,6};
            list{ind, 7} = entrylist{i,7};
            list{ind, 8} = entrylist{i,8};
        end
    end
    if(length(list) >8)
        for j =2:8 
            % Fix de un error que se genera por como MatLab funciona, y deja N filas vac?as 
            % despu?s de la primera, donde N es el n?mero de Columnas menos 1.
            list(2,:)= []; % Borrar fila 2 ocho veces.
        end
    end
elseif(strcmp(params(1), 'MaritalStatus'))
    for i = 1:length(entrylist)
         ind = length(list)+1;
         if(strcmp(entrylist{i,5},params{2}))
            list{ind, 1} = entrylist{i,1};
            list{ind, 2} = entrylist{i,2};
            list{ind, 3} = entrylist{i,3};
            list{ind, 4} = entrylist{i,4};
            list{ind, 5} = entrylist{i,5};
            list{ind, 6} = entrylist{i,6};
            list{ind, 7} = entrylist{i,7};
            list{ind, 8} = entrylist{i,8};
        end
    end
    if(length(list) >8)
        for j =2:8
            % Fix de un error que se genera por como MatLab funciona, y deja N filas vac?as 
            % despu?s de la primera, donde N es el n?mero de Columnas menos 1.
            list(2,:)= []; % Borrar fila 2 siete veces.
        end
    end
elseif(strcmp(params(1), 'Race'))
    for i = 1:length(entrylist)
         ind = length(list)+1;
         if(strcmp(entrylist{i,4},params{2}))
            list{ind, 1} = entrylist{i,1};
            list{ind, 2} = entrylist{i,2};
            list{ind, 3} = entrylist{i,3};
            list{ind, 4} = entrylist{i,4};
            list{ind, 5} = entrylist{i,5};
            list{ind, 6} = entrylist{i,6};
            list{ind, 7} = entrylist{i,7};
            list{ind, 8} = entrylist{i,8};
         end
    end
    if(length(list) >8)
        for j =2:8
            % Fix de un error que se genera por como MatLab funciona, y deja N filas vac?as 
            % despu?s de la primera, donde N es el n?mero de Columnas menos 1.
            list(2,:)= []; % Borrar fila 2 siete veces.
        end
    end
elseif(strcmp(params(1), 'PovertyBelow'))
    for i = 1:length(entrylist)
         ind = length(list)+1;
         pov = entrylist(i,8);
        if(pov <= params{2})
            list{ind, 1} = entrylist{i,1};
            list{ind, 2} = entrylist{i,2};
            list{ind, 3} = entrylist{i,3};
            list{ind, 4} = entrylist{i,4};
            list{ind, 5} = entrylist{i,5};
            list{ind, 6} = entrylist{i,6};
            list{ind, 7} = entrylist{i,7};
            list{ind, 8} = entrylist{i,8};
        end
    end
    if(length(list) >8)
        for j =2:8 
            % Fix de un error que se genera por como MatLab funciona, y deja N filas vac?as 
            % despu?s de la primera, donde N es el n?mero de Columnas menos 1.
            list(2,:)= []; % Borrar fila 2 ocho veces.
        end
    end
elseif(strcmp(params(1), 'PovertyAbove'))
    for i = 1:length(entrylist)
         ind = length(list)+1;
         pov = entrylist(i,8);
        if(pov >= params{2})
            list{ind, 1} = entrylist{i,1};
            list{ind, 2} = entrylist{i,2};
            list{ind, 3} = entrylist{i,3};
            list{ind, 4} = entrylist{i,4};
            list{ind, 5} = entrylist{i,5};
            list{ind, 6} = entrylist{i,6};
            list{ind, 7} = entrylist{i,7};
            list{ind, 8} = entrylist{i,8};
        end
    end
    if(length(list) >8)
        for j =2:8 
            % Fix de un error que se genera por como MatLab funciona, y deja N filas vac?as 
            % despu?s de la primera, donde N es el n?mero de Columnas menos 1.
            list(2,:)= []; % Borrar fila 2 ocho veces.
        end
    end
end
if(length(params) > 3)
    lista = refilter(list, params(3:end));
else
    lista = list;
end