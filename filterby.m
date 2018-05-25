function lista = filterby(other, core, extra)
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
if(strcmp(extra{1}, 'Name'))
    for i = 1:height(other)
         ind = length(list)+1;
        if(strfind(other.Name{i},extra{2}))
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
elseif(strcmp(extra{1}, 'Gender'))
    for i = 1:height(core)
         ind = length(list)+1;
        if(strfind(core.PatientGender{i},extra{2}))
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
elseif(strcmp(extra{1}, 'BornBefore'))
    for i = 1:height(core)
         ind = length(list)+1;
         pov = cellfun(@(s)s(1:4),core.PatientDateOfBirth,'UniformOutput',false);
        if(str2num(pov{i}) <= str2num(extra{2}))
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
elseif(strcmp(extra{1}, 'BornAfter'))
    for i = 1:height(core)
         ind = length(list)+1;
         pov = cellfun(@(s)s(1:4),core.PatientDateOfBirth,'UniformOutput',false);
        if(str2num(pov{i}) >= str2num(extra{2}))
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
elseif(strcmp(extra{1}, 'Language'))
    for i = 1:height(core)
         ind = length(list)+1;
         if(strfind(core.PatientLanguage{i},extra{2}))
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
elseif(strcmp(extra{1}, 'MaritalStatus'))
    for i = 1:height(core)
         ind = length(list)+1;
         if(strcmp(core.PatientMaritalStatus{i},extra{2}))
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
elseif(strcmp(extra{1}, 'Race'))
    for i = 1:height(core)
         ind = length(list)+1;
         if(strcmp(core.PatientRace{i},extra{2}))
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
elseif(strcmp(extra{1}, 'PovertyBelow'))
    for i = 1:height(core)
         ind = length(list)+1;
         pov = core.PatientPopulationPercentageBelowPoverty(:);
        if(pov(i) <= extra{2})
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
elseif(strcmp(extra{1}, 'PovertyAbove'))
    for i = 1:height(core)
         ind = length(list)+1;
         pov = core.PatientPopulationPercentageBelowPoverty(:);
        if(pov(i) >= extra{2})
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
if(length(extra)>3)
    lista = refilter(list, extra(3:end));
else
    lista=list;
end