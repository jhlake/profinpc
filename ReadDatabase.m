function [ ACPT, ADCPT, LCPT, PCPT, POI ] = ReadDatabase( PDAdress )
%READDATABASE Lee las bases de datos en la carpeta con direcci?n PDAdress y
%las carga en memoria para ser usadas. Esto no tiene problema pues podemos
%asumir que cabe en memoria. 




ACPT = readtable([PDAdress, '/AdmissionsCorePopulatedTable382.txt'],'Delimiter',' ');

ADCPT = readtable([PDAdress, '/AdmissionsDiagnosesCorePopulatedTable382.txt'],'Delimiter',' ');

LCPT = readtable([PDAdress, '/LabsCorePopulatedTable382.txt'],'Delimiter',' ');

PCPT = readtable([PDAdress, '/PatientCorePopulatedTable382.txt'],'Delimiter',' ');

POI = readtable([PDAdress, '/PatientOtherInformation382.txt'],'Delimiter',' ');

end

