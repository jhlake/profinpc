function lista = filterby(other, core, param, value, extra)
%%Implementaci?n de la funci?n de filtro por un parametro espec?fico.
%other es la tabla de Patient Other Information.
%core es la tabla de Core Populated Table.
%param es el par?metro por el que se quiere filtrar, puede ser:
% - Name
% - Gender
% - BornBefore
% - BornAfter
% - Race
% - MaritalStatus
% - Language 
% - PovertyBelow
% - PovertyAbove

list ={};
if(strcmp(param, 'Name'))
    for i = 1:height(other)
         ind = length(list)+1;
        if(strfind(other.Name{i},value))
            list{ind, 1} = other.Name{i};
            list{ind, 2} = core.PatientGender{i};
            list{ind, 3} = core.PatientDateOfBirth{i};
            list{ind, 4} = core.PatientRace{i};
            list{ind, 5} = core.PatientMaritalStatus{i};
            list{ind, 6} = core.PatientLanguage{i};
            list{ind, 7} = core.PatientPopulationPercentageBelowPoverty(i);
            list{ind, 8} = core.x___PatientID{i};
        end
    end
    if(length(list) >8)
        for j =2:8 
            % Fix de un error que se genera por como MatLab funciona, y deja N filas vac?as 
            % despu?s de la primera, donde N es el n?mero de Columnas menos 1.
            list(2,:)= []; % Borrar fila 2 ocho veces.
        end
    end
elseif(strcmp(param, 'Gender'))
    for i = 1:height(core)
         ind = length(list)+1;
        if(strfind(core.PatientGender{i},value))
            list{ind, 1} = other.Name{i};
            list{ind, 2} = core.PatientGender{i};
            list{ind, 3} = core.PatientDateOfBirth{i};
            list{ind, 4} = core.PatientRace{i};
            list{ind, 5} = core.PatientMaritalStatus{i};
            list{ind, 6} = core.PatientLanguage{i};
            list{ind, 7} = core.PatientPopulationPercentageBelowPoverty(i);
            list{ind, 8} = core.x___PatientID{i};
        end
    end
    if(length(list) >8)
        for j =2:8
            % Fix de un error que se genera por como MatLab funciona, y deja N filas vac?as 
            % despu?s de la primera, donde N es el n?mero de Columnas menos 1.
            list(2,:)= []; % Borrar fila 2 siete veces.
        end
    end
elseif(strcmp(param, 'BornBefore'))
    for i = 1:height(core)
         ind = length(list)+1;
         pov = cellfun(@(s)s(1:4),core.PatientDateOfBirth,'UniformOutput',false);
        if(str2num(pov{i}) <= str2num(value))
            list{ind, 1} = other.Name{i};
            list{ind, 2} = core.PatientGender{i};
            list{ind, 3} = core.PatientDateOfBirth{i};
            list{ind, 4} = core.PatientRace{i};
            list{ind, 5} = core.PatientMaritalStatus{i};
            list{ind, 6} = core.PatientLanguage{i};
            list{ind, 7} = core.PatientPopulationPercentageBelowPoverty(i);
            list{ind, 8} = core.x___PatientID{i};
        end
    end
    if(length(list) >8)
        for j =2:8 
            % Fix de un error que se genera por como MatLab funciona, y deja N filas vac?as 
            % despu?s de la primera, donde N es el n?mero de Columnas menos 1.
            list(2,:)= []; % Borrar fila 2 ocho veces.
        end
    end
elseif(strcmp(param, 'BornAfter'))
    for i = 1:height(core)
         ind = length(list)+1;
         pov = cellfun(@(s)s(1:4),core.PatientDateOfBirth,'UniformOutput',false);
        if(str2num(pov{i}) >= str2num(value))
            list{ind, 1} = other.Name{i};
            list{ind, 2} = core.PatientGender{i};
            list{ind, 3} = core.PatientDateOfBirth{i};
            list{ind, 4} = core.PatientRace{i};
            list{ind, 5} = core.PatientMaritalStatus{i};
            list{ind, 6} = core.PatientLanguage{i};
            list{ind, 7} = core.PatientPopulationPercentageBelowPoverty(i);
            list{ind, 8} = core.x___PatientID{i};
        end
    end
    if(length(list) >8)
        for j =2:8 
            % Fix de un error que se genera por como MatLab funciona, y deja N filas vac?as 
            % despu?s de la primera, donde N es el n?mero de Columnas menos 1.
            list(2,:)= []; % Borrar fila 2 ocho veces.
        end
    end
elseif(strcmp(param, 'Language'))
    for i = 1:height(core)
         ind = length(list)+1;
         if(strfind(core.PatientLanguage{i},value))
            list{ind, 1} = other.Name{i};
            list{ind, 2} = core.PatientGender{i};
            list{ind, 3} = core.PatientDateOfBirth{i};
            list{ind, 4} = core.PatientRace{i};
            list{ind, 5} = core.PatientMaritalStatus{i};
            list{ind, 6} = core.PatientLanguage{i};
            list{ind, 7} = core.PatientPopulationPercentageBelowPoverty(i);
            list{ind, 8} = core.x___PatientID{i};
        end
    end
    if(length(list) >8)
        for j =2:8 
            % Fix de un error que se genera por como MatLab funciona, y deja N filas vac?as 
            % despu?s de la primera, donde N es el n?mero de Columnas menos 1.
            list(2,:)= []; % Borrar fila 2 ocho veces.
        end
    end
elseif(strcmp(param, 'MaritalStatus'))
    for i = 1:height(core)
         ind = length(list)+1;
         if(strcmp(core.PatientMaritalStatus{i},value))
            list{ind, 1} = other.Name{i};
            list{ind, 2} = core.PatientGender{i};
            list{ind, 3} = core.PatientDateOfBirth{i};
            list{ind, 4} = core.PatientRace{i};
            list{ind, 5} = core.PatientMaritalStatus{i};
            list{ind, 6} = core.PatientLanguage{i};
            list{ind, 7} = core.PatientPopulationPercentageBelowPoverty(i);
            list{ind, 8} = core.x___PatientID{i};
        end
    end
    if(length(list) >8)
        for j =2:8
            % Fix de un error que se genera por como MatLab funciona, y deja N filas vac?as 
            % despu?s de la primera, donde N es el n?mero de Columnas menos 1.
            list(2,:)= []; % Borrar fila 2 siete veces.
        end
    end
elseif(strcmp(param, 'Race'))
    for i = 1:height(core)
         ind = length(list)+1;
         if(strcmp(core.PatientRace{i},value))
            list{ind, 1} = other.Name{i};
            list{ind, 2} = core.PatientGender{i};
            list{ind, 3} = core.PatientDateOfBirth{i};
            list{ind, 4} = core.PatientRace{i};
            list{ind, 5} = core.PatientMaritalStatus{i};
            list{ind, 6} = core.PatientLanguage{i};
            list{ind, 7} = core.PatientPopulationPercentageBelowPoverty(i);
            list{ind, 8} = core.x___PatientID{i};
         end
    end
    if(length(list) >8)
        for j =2:8
            % Fix de un error que se genera por como MatLab funciona, y deja N filas vac?as 
            % despu?s de la primera, donde N es el n?mero de Columnas menos 1.
            list(2,:)= []; % Borrar fila 2 siete veces.
        end
    end
elseif(strcmp(param, 'PovertyBelow'))
    for i = 1:height(core)
         ind = length(list)+1;
         pov = core.PatientPopulationPercentageBelowPoverty(:);
        if(pov(i) <= value)
            list{ind, 1} = other.Name{i};
            list{ind, 2} = core.PatientGender{i};
            list{ind, 3} = core.PatientDateOfBirth{i};
            list{ind, 4} = core.PatientRace{i};
            list{ind, 5} = core.PatientMaritalStatus{i};
            list{ind, 6} = core.PatientLanguage{i};
            list{ind, 7} = core.PatientPopulationPercentageBelowPoverty(i);
            list{ind, 8} = core.x___PatientID{i};
        end
    end
    if(length(list) >8)
        for j =2:8 
            % Fix de un error que se genera por como MatLab funciona, y deja N filas vac?as 
            % despu?s de la primera, donde N es el n?mero de Columnas menos 1.
            list(2,:)= []; % Borrar fila 2 ocho veces.
        end
    end
elseif(strcmp(param, 'PovertyAbove'))
    for i = 1:height(core)
         ind = length(list)+1;
         pov = core.PatientPopulationPercentageBelowPoverty(:);
        if(pov(i) >= value)
            list{ind, 1} = other.Name{i};
            list{ind, 2} = core.PatientGender{i};
            list{ind, 3} = core.PatientDateOfBirth{i};
            list{ind, 4} = core.PatientRace{i};
            list{ind, 5} = core.PatientMaritalStatus{i};
            list{ind, 6} = core.PatientLanguage{i};
            list{ind, 7} = core.PatientPopulationPercentageBelowPoverty(i);
            list{ind, 8} = core.x___PatientID{i};
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
if(length(extra)>1)
    lista = refilter(list, extra);
else
    lista=list;
end