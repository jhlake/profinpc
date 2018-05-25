function labs = showlab(labcore, id)
labs = {};
for i = 1:height(labcore)
    ind = length(labs) + 1;
    if(strfind(labcore.x___PatientID{i},id))
        labs{ind, 1} = labcore.AdmissionID{i};
        labs{ind, 2} = strcat(labcore.LabName{i},' ',labcore.LabValue{i},' ', labcore.LabUnits{i});
    end
end