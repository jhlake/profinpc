function [ handles ] = AddPatient( handles )

test = true;

for i = handles.newPat(:)
        test = test && ~isempty(i);
end

if test
   ID = generarID(handles.ACPT.x___PatientID);
   cellPatientOther = {[],handles.newPat.Photo, handles.newPat.Name, ID};
   cellPatientCore = {ID, handles.newPat.Gender,...
       handles.newPat.DateOfBirth, handles.newPat.Race,...
       handles.newPat.MaritalStatus, handles.newPat.Language,...
       handles.newPat.Poverty};
else
    beep;
    msgbox('Empty fields, the patient was NOT added', 'Error');
end

