function exams = examspat(diagnosis, core, id)


exams = {};
for i = 1:height(diagnosis)
    ind = length(exams)+1;
    if(strcmp(diagnosis.x___PatientID{i}, id))
        exams{ind,1} = diagnosis.AdmissionID(i);
        exams{ind,2} = diagnosis.AdmissionStartDate{i};
        exams{ind,3} = diagnosis.AdmissionEndDate{i};
        exams{ind,4} = core.PrimaryDiagnosisCode{i};
        exams{ind,5} = core.PrimaryDiagnosisDescription{i};
        
    end
end
for i = 1:4 % Fix to Matlab Error that adds 4 empty rows.
    exams(2,:) = [];
end