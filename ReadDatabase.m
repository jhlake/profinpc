function [ ACPT, ADCPT, LCPT, PCPT, POI ] = ReadDatabase( PDAdress )
%READDATABASE Lee las bases de datos en la carpeta con direcci?n PDAdress y
%las carga en memoria para ser usadas. Esto no tiene problema pues podemos
%asumir que cabe en memoria. 




ACPT = readtable([PDAdress, '/patientData/Historia_Clinica/AdmissionsCorePopulatedTable382.txt'],'Delimiter',' ');

ADCPT = readtable([PDAdress, '/patientData/Historia_Clinica/AdmissionsDiagnosesCorePopulatedTable382.txt'],'Delimiter',' ');

LCPT = readtable([PDAdress, '/patientData/Historia_Clinica/LabsCorePopulatedTable382.txt'],'Delimiter',' ');

PCPT = readtable([PDAdress, '/patientData/Historia_Clinica/PatientCorePopulatedTable382.txt'],'Delimiter',' ');

POI = readtable([PDAdress, '/patientData/Historia_Clinica/PatientOtherInformation382.txt'],'Delimiter',' ');

end

