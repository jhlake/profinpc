function patInfo = specificpatient(other, core, id)

patInfo=cell(1,8);
for i= 1:height(other)
    if(strcmp(other.x___PatientID{i}, id))
        patInfo{1, 1} = other.Name{i};
        patInfo{1, 2} = core.PatientGender{i};
        patInfo{1, 3} = core.PatientDateOfBirth{i};
        patInfo{1, 4} = core.PatientRace{i};
        patInfo{1, 5} = core.PatientMaritalStatus{i};
        patInfo{1, 6} = core.PatientLanguage{i};
        patInfo{1, 7} = core.PatientPopulationPercentageBelowPoverty(i);
        patInfo{1, 8} = other.Pictureid{i};
    end
end