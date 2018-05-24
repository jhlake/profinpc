function lista = filterby(other, core, param, value)
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

lista ={};
if(strcmp(param, 'Name'))
    for i = 1:height(other)
         ind = length(lista)+1;
        if(strfind(other.Name{i},value))
            lista{ind, 1} = other.Name{i};
            lista{ind, 2} = core.PatientGender{i};
            lista{ind, 3} = core.PatientDateOfBirth{i};
            lista{ind, 4} = core.PatientRace{i};
            lista{ind, 5} = core.PatientMaritalStatus{i};
            lista{ind, 6} = core.PatientLanguage{i};
            lista{ind, 7} = core.PatientPopulationPercentageBelowPoverty(i);
        end
    end
    if(length(lista) >7)
        for j =2:7 
            % Fix de un error que se genera por como MatLab funciona, y deja N filas vac?as 
            % despu?s de la primera, donde N es el n?mero de Columnas menos 1.
            lista(2,:)= []; % Borrar fila 2 siete veces.
        end
    end
elseif(strcmp(param, 'Gender'))
    for i = 1:height(core)
         ind = length(lista)+1;
        if(strfind(core.PatientGender{i},value))
            lista{ind, 1} = other.Name{i};
            lista{ind, 2} = core.PatientDateOfBirth{i};
            lista{ind, 3} = core.PatientRace{i};
            lista{ind, 4} = core.PatientMaritalStatus{i};
            lista{ind, 5} = core.PatientLanguage{i};
            lista{ind, 6} = core.PatientPopulationPercentageBelowPoverty(i);
        end
    end
    if(length(lista) >6)
        for j =2:6 
            % Fix de un error que se genera por como MatLab funciona, y deja N filas vac?as 
            % despu?s de la primera, donde N es el n?mero de Columnas menos 1.
            lista(2,:)= []; % Borrar fila 2 seis veces.
        end
    end
elseif(strcmp(param, 'BornBefore'))
    for i = 1:height(core)
         ind = length(lista)+1;
         pov = cellfun(@(s)s(1:4),core.PatientDateOfBirth,'UniformOutput',false);
        if(str2num(pov{i}) <= str2num(value))
            lista{ind, 1} = other.Name{i};
            lista{ind, 2} = core.PatientGender{i};
            lista{ind, 3} = core.PatientDateOfBirth{i};
            lista{ind, 4} = core.PatientRace{i};
            lista{ind, 5} = core.PatientMaritalStatus{i};
            lista{ind, 6} = core.PatientLanguage{i};
            lista{ind, 7} = core.PatientPopulationPercentageBelowPoverty(i);
        end
    end
    if(length(lista) >7)
        for j =2:7 
            % Fix de un error que se genera por como MatLab funciona, y deja N filas vac?as 
            % despu?s de la primera, donde N es el n?mero de Columnas menos 1.
            lista(2,:)= []; % Borrar fila 2 siete veces.
        end
    end
elseif(strcmp(param, 'BornAfter'))
    for i = 1:height(core)
         ind = length(lista)+1;
         pov = cellfun(@(s)s(1:4),core.PatientDateOfBirth,'UniformOutput',false);
        if(str2num(pov{i}) >= str2num(value))
            lista{ind, 1} = other.Name{i};
            lista{ind, 2} = core.PatientGender{i};
            lista{ind, 3} = core.PatientDateOfBirth{i};
            lista{ind, 4} = core.PatientRace{i};
            lista{ind, 5} = core.PatientMaritalStatus{i};
            lista{ind, 6} = core.PatientLanguage{i};
            lista{ind, 7} = core.PatientPopulationPercentageBelowPoverty(i);
        end
    end
    if(length(lista) >7)
        for j =2:7 
         % Fix de un error que se genera por como MatLab funciona, y deja N filas vac?as 
         % despu?s de la primera, donde N es el n?mero de Columnas menos 1.
            lista(2,:)= []; % Borrar fila 2 siete veces.
        end
    end
elseif(strcmp(param, 'Language'))
    for i = 1:height(core)
         ind = length(lista)+1;
         if(strfind(core.PatientLanguage{i},value))
            lista{ind, 1} = other.Name{i};
            lista{ind, 2} = core.PatientGender{i};
            lista{ind, 3} = core.PatientDateOfBirth{i};
            lista{ind, 4} = core.PatientRace{i};
            lista{ind, 5} = core.PatientMaritalStatus{i};
            lista{ind, 6} = core.PatientLanguage{i};
            lista{ind, 7} = core.PatientPopulationPercentageBelowPoverty(i);
        end
    end
    if(length(lista) >7)
        for j =2:7 
         % Fix de un error que se genera por como MatLab funciona, y deja N filas vac?as 
         % despu?s de la primera, donde N es el n?mero de Columnas menos 1.
            lista(2,:)= []; % Borrar fila 2 siete veces.
        end
    end
elseif(strcmp(param, 'MaritalStatus'))
    for i = 1:height(core)
         ind = length(lista)+1;
         if(strcmp(core.PatientMaritalStatus{i},value))
            lista{ind, 1} = other.Name{i};
            lista{ind, 2} = core.PatientGender{i};
            lista{ind, 3} = core.PatientDateOfBirth{i};
            lista{ind, 4} = core.PatientRace{i};
            lista{ind, 5} = core.PatientLanguage{i};
            lista{ind, 6} = core.PatientPopulationPercentageBelowPoverty(i);
        end
    end
    if(length(lista) >6)
        for j =2:6 
         % Fix de un error que se genera por como MatLab funciona, y deja N filas vac?as 
         % despu?s de la primera, donde N es el n?mero de Columnas menos 1.
            lista(2,:)= []; % Borrar fila 2 seis veces.
        end
    end
elseif(strcmp(param, 'Race'))
    for i = 1:height(core)
         ind = length(lista)+1;
         if(strcmp(core.PatientRace{i},value))
            lista{ind, 1} = other.Name{i};
            lista{ind, 2} = core.PatientGender{i};
            lista{ind, 3} = core.PatientDateOfBirth{i};
            lista{ind, 4} = core.PatientMaritalStatus{i};
            lista{ind, 5} = core.PatientLanguage{i};
            lista{ind, 6} = core.PatientPopulationPercentageBelowPoverty(i);
        end
    end
    if(length(lista) >6)
        for j =2:6 
         % Fix de un error que se genera por como MatLab funciona, y deja N filas vac?as 
         % despu?s de la primera, donde N es el n?mero de Columnas menos 1.
            lista(2,:)= []; % Borrar fila 2 seis veces.
        end
    end
elseif(strcmp(param, 'PovertyBelow'))
    for i = 1:height(core)
         ind = length(lista)+1;
         pov = core.PatientPopulationPercentageBelowPoverty(:);
        if(pov(i) <= value)
            lista{ind, 1} = other.Name{i};
            lista{ind, 2} = core.PatientGender{i};
            lista{ind, 3} = core.PatientDateOfBirth{i};
            lista{ind, 4} = core.PatientRace{i};
            lista{ind, 5} = core.PatientMaritalStatus{i};
            lista{ind, 6} = core.PatientLanguage{i};
            lista{ind, 7} = core.PatientPopulationPercentageBelowPoverty(i);
        end
    end
    if(length(lista) >7)
        for j =2:7 
            % Fix de un error que se genera por como MatLab funciona, y deja N filas vac?as 
            % despu?s de la primera, donde N es el n?mero de Columnas menos 1.
            lista(2,:)= []; % Borrar fila 2 siete veces.
        end
    end
elseif(strcmp(param, 'PovertyAbove'))
    for i = 1:height(core)
         ind = length(lista)+1;
         pov = core.PatientPopulationPercentageBelowPoverty(:);
        if(pov(i) >= value)
            lista{ind, 1} = other.Name{i};
            lista{ind, 2} = core.PatientGender{i};
            lista{ind, 3} = core.PatientDateOfBirth{i};
            lista{ind, 4} = core.PatientRace{i};
            lista{ind, 5} = core.PatientMaritalStatus{i};
            lista{ind, 6} = core.PatientLanguage{i};
            lista{ind, 7} = core.PatientPopulationPercentageBelowPoverty(i);
        end
    end
    if(length(lista) >7)
        for j =2:7 
            % Fix de un error que se genera por como MatLab funciona, y deja N filas vac?as 
            % despu?s de la primera, donde N es el n?mero de Columnas menos 1.
            lista(2,:)= []; % Borrar fila 2 siete veces.
        end
    end
end