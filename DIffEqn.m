function varargout = DIffEqn(varargin)
% DIFFEQN MATLAB code for DIffEqn.fig
%      DIFFEQN, by itself, creates a new DIFFEQN or raises the existing
%      singleton*.
%
%      H = DIFFEQN returns the handle to a new DIFFEQN or the handle to
%      the existing singleton*.
%
%      DIFFEQN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DIFFEQN.M with the given input arguments.
%
%      DIFFEQN('Property','Value',...) creates a new DIFFEQN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before DIffEqn_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to DIffEqn_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help DIffEqn

% Last Modified by GUIDE v2.5 24-May-2018 14:17:54

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @DIffEqn_OpeningFcn, ...
                   'gui_OutputFcn',  @DIffEqn_OutputFcn, ...
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


% --- Executes just before DIffEqn is made visible.
function DIffEqn_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to DIffEqn (see VARARGIN)
movegui('center')
% Choose default command line output for DIffEqn
handles.output = hObject;

set(hObject,'HandleVisibility','on');
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes DIffEqn wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = DIffEqn_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function GlucInicial_Callback(hObject, eventdata, handles)
% hObject    handle to GlucInicial (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of GlucInicial as text
%        str2double(get(hObject,'String')) returns contents of GlucInicial as a double


% --- Executes during object creation, after setting all properties.
function GlucInicial_CreateFcn(hObject, eventdata, handles)
% hObject    handle to GlucInicial (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function InsuInicial_Callback(hObject, eventdata, handles)
% hObject    handle to InsuInicial (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of InsuInicial as text
%        str2double(get(hObject,'String')) returns contents of InsuInicial as a double


% --- Executes during object creation, after setting all properties.
function InsuInicial_CreateFcn(hObject, eventdata, handles)
% hObject    handle to InsuInicial (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function InsuRate_Callback(hObject, eventdata, handles)
% hObject    handle to InsuRate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of InsuRate as text
%        str2double(get(hObject,'String')) returns contents of InsuRate as a double


% --- Executes during object creation, after setting all properties.
function InsuRate_CreateFcn(hObject, eventdata, handles)
% hObject    handle to InsuRate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in SolveEqn.
function SolveEqn_Callback(hObject, eventdata, handles)
% hObject    handle to SolveEqn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
y0 = [str2double(handles.GlucInicial.String);str2double(handles.InsuInicial.String)];
rb = str2double(handles.InsuRate.String);
[yout, tout] = SolveDM(y0, rb);
plot(yout, tout, 'LineWidth', 3);
xlabel('Time'); ylabel('Units');
legend('Glucosa', 'Insulina');
