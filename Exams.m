function varargout = Exams(varargin)
% EXAMS MATLAB code for Exams.fig
%      EXAMS, by itself, creates a new EXAMS or raises the existing
%      singleton*.
%
%      H = EXAMS returns the handle to a new EXAMS or the handle to
%      the existing singleton*.
%
%      EXAMS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EXAMS.M with the given input arguments.
%
%      EXAMS('Property','Value',...) creates a new EXAMS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Exams_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Exams_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Exams

% Last Modified by GUIDE v2.5 24-May-2018 18:33:07

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Exams_OpeningFcn, ...
                   'gui_OutputFcn',  @Exams_OutputFcn, ...
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


% --- Executes just before Exams is made visible.
function Exams_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Exams (see VARARGIN)

% Choose default command line output for Exams
handles.output = hObject;


set(hObject,'HandleVisibility','on');
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Exams wait for user response (see UIRESUME)
% uiwait(handles.examsfig);


% --- Outputs from this function are returned to the command line.
function varargout = Exams_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in ButBeatPoli.
function ButBeatPoli_Callback(hObject, eventdata, handles)
% hObject    handle to ButBeatPoli (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in ButHighPoli.
function ButHighPoli_Callback(hObject, eventdata, handles)
% hObject    handle to ButHighPoli (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in ButLowPoli.
function ButLowPoli_Callback(hObject, eventdata, handles)
% hObject    handle to ButLowPoli (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in ButTempPoli.
function ButTempPoli_Callback(hObject, eventdata, handles)
% hObject    handle to ButTempPoli (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function daysbeats_Callback(hObject, eventdata, handles)
% hObject    handle to daysbeats (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of daysbeats as text
%        str2double(get(hObject,'String')) returns contents of daysbeats as a double


% --- Executes during object creation, after setting all properties.
function daysbeats_CreateFcn(hObject, eventdata, handles)
% hObject    handle to daysbeats (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function dayslow_Callback(hObject, eventdata, handles)
% hObject    handle to dayslow (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of dayslow as text
%        str2double(get(hObject,'String')) returns contents of dayslow as a double


% --- Executes during object creation, after setting all properties.
function dayslow_CreateFcn(hObject, eventdata, handles)
% hObject    handle to dayslow (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function dayshigh_Callback(hObject, eventdata, handles)
% hObject    handle to dayshigh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of dayshigh as text
%        str2double(get(hObject,'String')) returns contents of dayshigh as a double


% --- Executes during object creation, after setting all properties.
function dayshigh_CreateFcn(hObject, eventdata, handles)
% hObject    handle to dayshigh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function daystemp_Callback(hObject, eventdata, handles)
% hObject    handle to daystemp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of daystemp as text
%        str2double(get(hObject,'String')) returns contents of daystemp as a double


% --- Executes during object creation, after setting all properties.
function daystemp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to daystemp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
