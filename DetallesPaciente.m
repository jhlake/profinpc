function varargout = DetallesPaciente(varargin)
% DETALLESPACIENTE MATLAB code for DetallesPaciente.fig
%      DETALLESPACIENTE, by itself, creates a new DETALLESPACIENTE or raises the existing
%      singleton*.
%
%      H = DETALLESPACIENTE returns the handle to a new DETALLESPACIENTE or the handle to
%      the existing singleton*.
%
%      DETALLESPACIENTE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DETALLESPACIENTE.M with the given input arguments.
%
%      DETALLESPACIENTE('Property','Value',...) creates a new DETALLESPACIENTE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before DetallesPaciente_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to DetallesPaciente_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help DetallesPaciente

% Last Modified by GUIDE v2.5 24-May-2018 14:48:56

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @DetallesPaciente_OpeningFcn, ...
                   'gui_OutputFcn',  @DetallesPaciente_OutputFcn, ...
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


% --- Executes just before DetallesPaciente is made visible.
function DetallesPaciente_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to DetallesPaciente (see VARARGIN)
movegui('center')
% Choose default command line output for DetallesPaciente
handles.output = hObject;
global adress tempo PCORE POTHER;
handles.datosf1 = guidata(findobj('Tag', 'mainfig'));
global todopa;
todopa = specificpatient(POTHER,PCORE,tempo{1,8});
handles.todo=todopa;
handles.url = adress;
axes('axis5')
matlabImage = imread(strcat(handles.url,tempo{1,8}));
image(matlabImage)
axis off
axis image;

set(handles.DispBirth, 'String', myString);
set(hObject,'HandleVisibility','on');

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes DetallesPaciente wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = DetallesPaciente_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in ButECG.
function ButECG_Callback(hObject, eventdata, handles)
% hObject    handle to ButECG (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
fid = fopen(strcat(address,'/',handles.todo{1,9}));
[bpm, alert] = datapro(fread(fid, 'single'));
if(alert)
    f = msgbox({'This Patients Beats per Minute are: ', int2str(bpm);'It is under the normal range of 60 to 100.'});
else
    f = msgbox({'This Patients Beats per Minute are: ', int2str(bpm);'WARNING! It is outside the normal range!'});
end



% --- Executes on button press in ButLab.
function ButLab_Callback(hObject, eventdata, handles)
% hObject    handle to ButLab (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global LABCORE;
stringFo=showlab(LABCORE, handles.pacienteid);
OpenLabsF(stringFo);



function ChangeName_Callback(hObject, eventdata, handles)
% hObject    handle to ChangeName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ChangeName as text
%        str2double(get(hObject,'String')) returns contents of ChangeName as a double


% --- Executes during object creation, after setting all properties.
function ChangeName_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ChangeName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
set(hObject, 'String',handles.todo(1, 1));



function ChangeSurname_Callback(hObject, eventdata, handles)
% hObject    handle to ChangeSurname (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ChangeSurname as text
%        str2double(get(hObject,'String')) returns contents of ChangeSurname as a double


% --- Executes during object creation, after setting all properties.
function ChangeSurname_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ChangeSurname (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in ChangeGender.
function ChangeGender_Callback(hObject, eventdata, handles)
% hObject    handle to ChangeGender (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns ChangeGender contents as cell array
%        contents{get(hObject,'Value')} returns selected item from ChangeGender


% --- Executes during object creation, after setting all properties.
function ChangeGender_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ChangeGender (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
if(strcmp(handles.todo{1,6}, 'Male'))
    set(hObject, 'Value', 2);
else
    set(hObject, 'Value', 3);
end



% --- Executes on selection change in ChangeRace.
function ChangeRace_Callback(hObject, eventdata, handles)
% hObject    handle to ChangeRace (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns ChangeRace contents as cell array
%        contents{get(hObject,'Value')} returns selected item from ChangeRace


% --- Executes during object creation, after setting all properties.
function ChangeRace_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ChangeRace (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
aop = handles.todo;
if(strcmp(aop{1,4}, 'White'))
    set(hObject, 'Value', 2);
elseif(strcmp(aop{1,4}, 'Asian'))
    set(hObject, 'Value', 3);
elseif(strcmp(aop{1,4}, 'African American'))
    set(hObject, 'Value', 4);
elseif(strcmp(aop{1,4}, 'Unknown'))
    set(hObject, 'Value', 5);
end



function ChangeLanguage_Callback(hObject, eventdata, handles)
% hObject    handle to ChangeLanguage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ChangeLanguage as text
%        str2double(get(hObject,'String')) returns contents of ChangeLanguage as a double


% --- Executes during object creation, after setting all properties.
function ChangeLanguage_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ChangeLanguage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ChangePoverty_Callback(hObject, eventdata, handles)
% hObject    handle to ChangePoverty (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ChangePoverty as text
%        str2double(get(hObject,'String')) returns contents of ChangePoverty as a double


% --- Executes during object creation, after setting all properties.
function ChangePoverty_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ChangePoverty (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
set(hObject, 'String', int2str(handles.todo{1, 7}));


% --- Executes on selection change in ChangeMarital.
function ChangeMarital_Callback(hObject, eventdata, handles)
% hObject    handle to ChangeMarital (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns ChangeMarital contents as cell array
%        contents{get(hObject,'Value')} returns selected item from ChangeMarital


% --- Executes during object creation, after setting all properties.
function ChangeMarital_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ChangeMarital (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
if(strcmp(handles.todo{1,5}, 'Single'))
    set(hObject, 'Value', 2);
elseif(strcmp(handles.todo{1,5}, 'Married'))
    set(hObject, 'Value', 3);
elseif(strcmp(handles.todo{1,5}, 'Divorced'))
    set(hObject, 'Value', 4);
elseif(strcmp(handles.todo{1,5}, 'Unknown'))
    set(hObject, 'Value', 5);
end


% --- Executes on button press in SaveChanges.
function SaveChanges_Callback(hObject, eventdata, handles)
% hObject    handle to SaveChanges (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in ChangeStart.
function ChangeStart_Callback(hObject, eventdata, handles)
% hObject    handle to ChangeStart (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in ChangeEnd.
function ChangeEnd_Callback(hObject, eventdata, handles)
% hObject    handle to ChangeEnd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in ButExam.
function ButExam_Callback(hObject, eventdata, handles)
% hObject    handle to ButExam (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global todopa
nombre = todopa{1};

C = strsplit(nombre, ' ');
global adress;
adress1 = [C{3} '_' C{4} '_' C{1} '_' C{2}(1:end-1) '.txt'];
global fulladr;
fulladr = [adress '/Exams/' adress1];
Exams





function EditDiag_Callback(hObject, eventdata, handles)
% hObject    handle to EditDiag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EditDiag as text
%        str2double(get(hObject,'String')) returns contents of EditDiag as a double


% --- Executes during object creation, after setting all properties.
function EditDiag_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EditDiag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
