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

% Last Modified by GUIDE v2.5 24-May-2018 18:31:44

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
movegui('center');
handles.output = hObject;
global adress;
adress = uigetdir();

[ACPT,ADCPT,LCPT,PCPT,POI ] = ReadDatabase(adress);

handles.ACPT = ACPT;
handles.ADCPT = ADCPT;
handles.LCPT = LCPT;
handles.PCPT = PCPT;
handles.POI = POI;
global searchParam;
global ACORE ADIAG LABCORE PCORE POTHER;
ACORE = ACPT;
ADIAG = ADCPT;
LABCORE = LCPT;
PCORE = PCPT;
POTHER = POI;

handles.pacienteact = struct('Name',[]);
handles.newPat = struct('Name',[],'DateOfBirth',[],...
    'Gender',[],'Race',[],'Language',[],'Poverty',[],'MaritalStatus',[],'Photo',[],'ID',[]);
searchParam = struct('Name',[],'DateOfBirth',[],...
    'Gender',[],'Race',[],'Language',[],'Poverty',[],'MaritalStatus',[]);
set(hObject,'HandleVisibility','on');



lista = handles.POI.Name;


a = cat(2, lista(:,1));
set(handles.patientsListbox,'String', a);

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes main wait for user response (see UIRESUME)
% uiwait(handles.mainfig);


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
Buscar(handles);
global searchParam;
global done; done = false;
while ~done
    pause(1);
end

fields = fieldnames(searchParam);

for i = 1:numel(fields)
    a = fields{i};
    res = eval(['searchParam.', a]);
end

%lista = {'giyehrud','gyfisu','yufer'};
% set(handles.patientsListbox,'String', lista);

count = 0;
param = {};
if ~isempty(searchParam.Name)
    count = count+1;
    param{end+1} = 'Name';
    param{end+1} = searchParam.Name;
end

if ~strcmp(searchParam.DateOfBirth, 'AAAA-MM-DD HH:MM:SS.MSS')
    count = count+1;
    param{end+1} = 'BornAfter';
    param{end+1} = searchParam.DateOfBirth;
end

if ~strcmp(searchParam.Gender, 'All')
    count = count+1;
    param{end+1} = 'Gender';
    param{end+1} = searchParam.Gender;
end

if ~strcmp(searchParam.Race, 'All')
    count = count+1;
    param{end+1} = 'Race';
    param{end+1} = searchParam.Race;
end

if ~isempty(searchParam.Language)
    count = count+1;
    param{end+1} = 'Language';
    param{end+1} = searchParam.Language;
end

if ~strcmp(searchParam.Poverty, '0')
    count = count+1;
    param{end+1} = 'PovertyBelow';
    param{end+1} = str2double(searchParam.Poverty);
end

if ~strcmp(searchParam.MaritalStatus, 'All')
    count = count+1;
    param{end+1} = 'MaritalStatus';
    param{end+1} = searchParam.MaritalStatus;
end
if count >= 1
    lista = filterby(handles.POI, handles.PCPT, param);
end

if numel(lista) == 0
    lista = handles.POI.Name;
end

a = cat(2, lista(:,1));
set(handles.patientsListbox,'String', a);


%disp(searchParam);






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
DIffEqn



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
index_selected = get(handles.patientsListbox,'Value');
list = get(handles.patientsListbox,'String');
nombrepaciente = list{index_selected};
global tempo;
tempo = filterby(handles.POI, handles.PCPT, {'Name', nombrepaciente});
handles.pacienteact = tempo{1,8};
guidata(hObject, handles);
DetallesPaciente



% --- Executes on button press in resetSearchButton.
function resetSearchButton_Callback(hObject, eventdata, handles)
% hObject    handle to resetSearchButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

lista = handles.POI.Name;


a = cat(2, lista(:,1));
set(handles.patientsListbox,'String', a);




% --- Executes on button press in selectPhotoButton.
function selectPhotoButton_Callback(hObject, eventdata, handles)
% hObject    handle to selectPhotoButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

photoAdress = uigetfile('*.png', '*.jpg');
handles.newPatient.Photo = photoAdress;
guidata(hObject, handles);



% --- Executes on button press in pushbutton6.
function addPatientButton_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles.newPat.Name = handles.nameTextbox.String;

handles.newPat.DateOfBirth = handles.DateField.String;

index_selected = get(handles.genderSelector,'Value');
list = get(handles.genderSelector,'String');
handles.newPat.Gender = list{index_selected};

index_selected = get(handles.raceSelector,'Value');
list = get(handles.raceSelector,'String');
handles.newPat.Race = list{index_selected};

handles.newPat.Language = handles.languageTextbox.String;

handles.newPat.Poverty = handles.povertyTextbox.String;

index_selected = get(handles.maritalStatusSelector,'Value');
list = get(handles.maritalStatusSelector,'String');
handles.newPat.MaritalStatus = list{index_selected};

AddPatient(handles);

global adress;
[ACPT,ADCPT,LCPT,PCPT,POI ] = ReadDatabase(adress);

handles.ACPT = ACPT;
handles.ADCPT = ADCPT;
handles.LCPT = LCPT;
handles.PCPT = PCPT;
handles.POI = POI;
guidata(hObject, handles);



% --- Executes on button press in dateOfBirthButton.
function dateOfBirthButton_Callback(hObject, eventdata, handles)
% hObject    handle to dateOfBirthButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
uicalendar('DestinationUI', {handles.DateField, 'String'});


% --- Executes on selection change in genderMenu.
function genderSelector_Callback(hObject, eventdata, handles)
% hObject    handle to genderMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns genderMenu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from genderMenu


% --- Executes during object creation, after setting all properties.
function genderSelector_CreateFcn(hObject, eventdata, handles)
% hObject    handle to genderMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in maritalSatusMenu.
function maritalStatusSelector_Callback(hObject, eventdata, handles)
% hObject    handle to maritalSatusMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% Hints: contents = cellstr(get(hObject,'String')) returns maritalSatusMenu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from maritalSatusMenu


% --- Executes during object creation, after setting all properties.
function maritalStatusSelector_CreateFcn(hObject, eventdata, handles)
% hObject    handle to maritalSatusMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu3.
function popupmenu3_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu3


% --- Executes during object creation, after setting all properties.
function popupmenu3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu7.
function popupmenu7_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu7 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu7


% --- Executes during object creation, after setting all properties.
function popupmenu7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu8.
function raceSelector_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu8 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu8


% --- Executes during object creation, after setting all properties.
function raceSelector_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
