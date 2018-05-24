function varargout = main(varargin)
% MAIN MATLAB code for main.fig
%      MAIN, by itself, creates a new MAIN or raises the existing
%      singleton*.
%
%      H = MAIN returns the handle to a new MAIN or the handle to
%      the existing singleton*.
%
%      MAIN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAIN.M with the given input arguments.
%
%      MAIN('Property','Value',...) creates a new MAIN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before main_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to main_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help main

% Last Modified by GUIDE v2.5 24-May-2018 12:12:32

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @main_OpeningFcn, ...
                   'gui_OutputFcn',  @main_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before main is made visible.
function main_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to main (see VARARGIN)

% Choose default command line output for main


adress = uigetdir();



[ACPT, ADCPT, LCPT, PCPT, POI] = ReadDatabase(adress);
handles.output = hObject;
handles.ACPT = ACPT;
handles.ADCPT = ADCPT;
handles.LCPT = LCPT;
handles.PCPT = PCPT;
handles.POI = POI;

handles.newPat = struct('Names',[],'Surnames',[],'DateOfBirth',[],...
    'Gender',[],'Race',[],'Language',[],'Povery',[],'MaritalStatus',[],'Photo',[],'ID',[]);
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes main wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = main_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in searchButton.
function searchButton_Callback(hObject, eventdata, handles)
% hObject    handle to searchButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in patientsListbox.
function patientsListbox_Callback(hObject, eventdata, handles)
% hObject    handle to patientsListbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns patientsListbox contents as cell array
%        contents{get(hObject,'Value')} returns selected item from patientsListbox


% --- Executes during object creation, after setting all properties.
function patientsListbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to patientsListbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in solveODEButton.
function solveODEButton_Callback(hObject, eventdata, handles)
% hObject    handle to solveODEButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function nameTextbox_Callback(hObject, eventdata, handles)
% hObject    handle to nameTextbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nameTextbox as text
%        str2double(get(hObject,'String')) returns contents of nameTextbox as a double


% --- Executes during object creation, after setting all properties.
function nameTextbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nameTextbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function surnameTextbox_Callback(hObject, eventdata, handles)
% hObject    handle to surnameTextbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of surnameTextbox as text
%        str2double(get(hObject,'String')) returns contents of surnameTextbox as a double


% --- Executes during object creation, after setting all properties.
function surnameTextbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to surnameTextbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function languageTextbox_Callback(hObject, eventdata, handles)
% hObject    handle to languageTextbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of languageTextbox as text
%        str2double(get(hObject,'String')) returns contents of languageTextbox as a double


% --- Executes during object creation, after setting all properties.
function languageTextbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to languageTextbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function povertyTextbox_Callback(hObject, eventdata, handles)
% hObject    handle to povertyTextbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of povertyTextbox as text
%        str2double(get(hObject,'String')) returns contents of povertyTextbox as a double


% --- Executes during object creation, after setting all properties.
function povertyTextbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to povertyTextbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in detailsButton.
function detailsButton_Callback(hObject, eventdata, handles)
% hObject    handle to detailsButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
DetallesPaciente


% --- Executes on button press in resetSearchButton.
function resetSearchButton_Callback(hObject, eventdata, handles)
% hObject    handle to resetSearchButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in selectPhotoButton.
function selectPhotoButton_Callback(hObject, eventdata, handles)
% hObject    handle to selectPhotoButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
photoAdress = uigetdir();
handles.newPatient.Photo = photoAdress;
guidata(hObject, handles);








% --- Executes on button press in addPatientButton.
function addPatientButton_Callback(hObject, eventdata, handles)
% hObject    handle to addPatientButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in dateOfBirthButton.
function dateOfBirthButton_Callback(hObject, eventdata, handles)
% hObject    handle to dateOfBirthButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

uicalendar('DestinationUI', handles.DateField);
guidata(hObject, handles);



% --- Executes on selection change in genderMenu.
function genderMenu_Callback(hObject, eventdata, handles)
% hObject    handle to genderMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns genderMenu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from genderMenu


% --- Executes during object creation, after setting all properties.
function genderMenu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to genderMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in maritalSatusMenu.
function maritalSatusMenu_Callback(hObject, eventdata, handles)
% hObject    handle to maritalSatusMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% Hints: contents = cellstr(get(hObject,'String')) returns maritalSatusMenu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from maritalSatusMenu


% --- Executes during object creation, after setting all properties.
function maritalSatusMenu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to maritalSatusMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in raceSelector.
function raceSelector_Callback(hObject, eventdata, handles)
% hObject    handle to raceSelector (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns raceSelector contents as cell array
%        contents{get(hObject,'Value')} returns selected item from raceSelector


% --- Executes during object creation, after setting all properties.
function raceSelector_CreateFcn(hObject, eventdata, handles)
% hObject    handle to raceSelector (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in maritalStatusSelector.
function maritalStatusSelector_Callback(hObject, eventdata, handles)
% hObject    handle to maritalStatusSelector (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns maritalStatusSelector contents as cell array
%        contents{get(hObject,'Value')} returns selected item from maritalStatusSelector


% --- Executes during object creation, after setting all properties.
function maritalStatusSelector_CreateFcn(hObject, eventdata, handles)
% hObject    handle to maritalStatusSelector (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in genderSelector.
function genderSelector_Callback(hObject, eventdata, handles)
% hObject    handle to genderSelector (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns genderSelector contents as cell array
%        contents{get(hObject,'Value')} returns selected item from genderSelector


% --- Executes during object creation, after setting all properties.
function genderSelector_CreateFcn(hObject, eventdata, handles)
% hObject    handle to genderSelector (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
