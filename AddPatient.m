function [ handles ] = AddPatient( handles )

test = true;
%
% fiel = fieldnames(handles.newPat);
%
% test = test && ~isempty(handles.newPat.fiel{:});

% a = handles.newPat(1);
% for i = a(:);
%     test = test && ~isempty(i);
% end


try
    ID = generarID(handles.ACPT.x___PatientID);
    cellPatientOther = {[],handles.newPat.Photo, handles.newPat.Name, ID};
    cellPatientCore = {ID, handles.newPat.Gender,...
        handles.newPat.DateOfBirth, handles.newPat.Race,...
        handles.newPat.MaritalStatus, handles.newPat.Language,...
        str2double(handles.newPat.Poverty)};
    handles.POI = [handles.POI;cellPatientOther];
    handles.PCPT = [handles.PCPT;cellPatientCore];
    writetable(handles.POI, 'patientData/HistoriaClinica/PatientCorePopulatedTable382.txt', 'Delimiter','\t');
    writetable(handles.PCPT, 'patientData/HistoriaClinica/PatientOtherInformation382.txt', 'Delimiter','\t');
catch 
    beep;
    msgbox('Empty fields, the patient was NOT added', 'Error');
end
    
    
