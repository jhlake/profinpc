function lista = refilter(entrylist, varargin)

list ={};
if(strcmp(varargin(1), 'Name'))
    for i = 1:height(other)
         ind = length(list)+1;
        if(strfind(other.Name{i},varargin(2)))
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
elseif(strcmp(varargin(1), 'Gender'))
    for i = 1:height(core)
         ind = length(list)+1;
        if(strfind(core.PatientGender{i},varargin(2)))
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
elseif(strcmp(varargin(1), 'BornBefore'))
    for i = 1:height(core)
         ind = length(list)+1;
         pov = cellfun(@(s)s(1:4),core.PatientDateOfBirth,'UniformOutput',false);
        if(str2num(pov{i}) <= str2num(varargin(2)))
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
elseif(strcmp(varargin(1), 'BornAfter'))
    for i = 1:height(core)
         ind = length(list)+1;
         pov = cellfun(@(s)s(1:4),core.PatientDateOfBirth,'UniformOutput',false);
        if(str2num(pov{i}) >= str2num(varargin(2)))
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
elseif(strcmp(varargin(1), 'Language'))
    for i = 1:height(core)
         ind = length(list)+1;
         if(strfind(core.PatientLanguage{i},varargin(2)))
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
elseif(strcmp(varargin(1), 'MaritalStatus'))
    for i = 1:height(core)
         ind = length(list)+1;
         if(strcmp(core.PatientMaritalStatus{i},varargin(2)))
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
elseif(strcmp(varargin(1), 'Race'))
    for i = 1:height(core)
         ind = length(list)+1;
         if(strcmp(core.PatientRace{i},varargin(2)))
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
elseif(strcmp(varargin(1), 'PovertyBelow'))
    for i = 1:height(core)
         ind = length(list)+1;
         pov = core.PatientPopulationPercentageBelowPoverty(:);
        if(pov(i) <= varargin(2))
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
elseif(strcmp(varargin(1), 'PovertyAbove'))
    for i = 1:height(core)
         ind = length(list)+1;
         pov = core.PatientPopulationPercentageBelowPoverty(:);
        if(pov(i) >= varargin(2))
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
if(length(varargin) > 3)
    lista = refilter(list, varargin(3:end));
end