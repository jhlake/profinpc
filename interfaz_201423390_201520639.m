function varargout = interfaz_201423390_201520639(varargin)
% INTERFAZ_201423390_201520639 MATLAB code for interfaz_201423390_201520639.fig
%      INTERFAZ_201423390_201520639, by itself, creates a new INTERFAZ_201423390_201520639 or raises the existing
%      singleton*.
%
%      H = INTERFAZ_201423390_201520639 returns the handle to a new INTERFAZ_201423390_201520639 or the handle to
%      the existing singleton*.
%
%      INTERFAZ_201423390_201520639('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INTERFAZ_201423390_201520639.M with the given input arguments.
%
%      INTERFAZ_201423390_201520639('Property','Value',...) creates a new INTERFAZ_201423390_201520639 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before interfaz_201423390_201520639_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to interfaz_201423390_201520639_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help interfaz_201423390_201520639

% Last Modified by GUIDE v2.5 16-Apr-2018 14:56:32

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @interfaz_201423390_201520639_OpeningFcn, ...
    'gui_OutputFcn',  @interfaz_201423390_201520639_OutputFcn, ...
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


% --- Executes just before interfaz_201423390_201520639 is made visible.
function interfaz_201423390_201520639_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to interfaz_201423390_201520639 (see VARARGIN)

% Choose default command line output for interfaz_201423390_201520639
handles.output = hObject;
handles.estudiantes = struct('Nombre',[],'Apellido',[],'Codigo',[],...
    'Nota_parciales',[],'Nota_lab',[],'Nota_proyecto',[]);

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes interfaz_201423390_201520639 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = interfaz_201423390_201520639_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in boton_agregar.
function boton_agregar_Callback(hObject, eventdata, handles)
% hObject    handle to boton_agregar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
prompt = {'Nombre','Apellido','Codigo','Nota final de parciales', 'Nota final de laboratorio','Nota del proyecto final'};
title = 'Agregar estudiante';
dims = [1 45];
answer = inputdlg(prompt,title,dims);
%disp(answer);
% 'Nombre',[],'Apellido',[],'Codigo',[],...
%     'Nota_parciales',[],'Nota_lab',[],'Nota_proyecto',[]
handles.estudiantes(numel(handles.estudiantes)+1).Nombre = answer(1);
handles.estudiantes(end).Apellido = answer(2);
handles.estudiantes(end).Codigo = answer(3);
handles.estudiantes(end).Nota_parciales = str2double(answer(4));
handles.estudiantes(end).Nota_lab = str2double(answer(5));
handles.estudiantes(end).Nota_proyecto = str2double(answer(6));
%disp(handles.estudiantes(end));
%disp(handles.estudiantes);

promedios = zeros(1,numel(handles.estudiantes));
for i = 2:numel(handles.estudiantes)
    lista{i-1} = [char(handles.estudiantes(i).Nombre) ' ' char(handles.estudiantes(i).Apellido)];
    promedios(i) = 0.6*handles.estudiantes(i).Nota_parciales + 0.25*handles.estudiantes(i).Nota_lab + 0.15*handles.estudiantes(i).Nota_proyecto;

end
h = histogram(promedios(2:end));
h.FaceColor = [0.8510 0.521 0.2314];

%disp(lista);
%disp('setting list');
set(handles.lista_estudiantes,'String',lista);
%disp(handles.estudiantes(end));


guidata(hObject, handles);


% --- Executes on button press in boton_histograma.
function boton_histograma_Callback(hObject, eventdata, handles)
% hObject    handle to boton_histograma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in lista_estudiantes.
function lista_estudiantes_Callback(hObject, eventdata, handles)
% hObject    handle to lista_estudiantes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns lista_estudiantes contents as cell array
%        contents{get(hObject,'Value')} returns selected item from



% --- Executes during object creation, after setting all properties.
function lista_estudiantes_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lista_estudiantes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes on button press in boton_editar.
function boton_editar_Callback(hObject, eventdata, handles)
% hObject    handle to boton_editar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
nombre_completo = char(handles.lista_estudiantes.String(handles.lista_estudiantes.Value));
prompt = {'Nota final de parciales','Nota final de laboratorio','Nota del proyecto final'};
title = ['Editar notas de ' nombre_completo];
dims = [1 45];
split = strsplit(nombre_completo,' ');
estunom = find(strcmp([handles.estudiantes.Nombre],split(1)));
estuap = find(strcmp([handles.estudiantes.Apellido],split(2)));
elest = intersect(estunom,estuap)+1;
definput = {num2str(handles.estudiantes(elest).Nota_parciales), num2str(handles.estudiantes(elest).Nota_lab),num2str(handles.estudiantes(elest).Nota_proyecto)};
answer = inputdlg(prompt,title,dims, definput);
handles.estudiantes(elest).Nota_parciales = str2double(answer(1));
handles.estudiantes(elest).Nota_lab = str2double(answer(2));
handles.estudiantes(elest).Nota_proyecto = str2double(answer(3));

promedios = zeros(1,numel(handles.estudiantes));
for i = 2:numel(handles.estudiantes)
    promedios(i) = 0.6*handles.estudiantes(i).Nota_parciales + 0.25*handles.estudiantes(i).Nota_lab + 0.15*handles.estudiantes(i).Nota_proyecto;
end

h = histogram(promedios(2:end));
h.FaceColor = [0.8510 0.521 0.2314];

guidata(hObject, handles);

% --- Executes on button press in boton_promedio.
function boton_promedio_Callback(hObject, eventdata, handles)
% hObject    handle to boton_promedio (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
nombre_completo = char(handles.lista_estudiantes.String(handles.lista_estudiantes.Value));
split = strsplit(nombre_completo,' ');
estunom = find(strcmp([handles.estudiantes.Nombre],split(1)));
estuap = find(strcmp([handles.estudiantes.Apellido],split(2)));
elest = intersect(estunom,estuap)+1;
prom = 0.6*handles.estudiantes(elest).Nota_parciales + 0.25*handles.estudiantes(elest).Nota_lab + 0.15*handles.estudiantes(elest).Nota_proyecto;
el_msg = msgbox(['El promedio de ' nombre_completo ' es: ' num2str(prom)], 'Promedio ponderado', 'help');
guidata(hObject, handles);


% --- Executes on button press in boton_eliminar.
function boton_eliminar_Callback(hObject, eventdata, handles)
% hObject    handle to boton_eliminar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
nombre_completo = char(handles.lista_estudiantes.String(handles.lista_estudiantes.Value));
split = strsplit(nombre_completo,' ');
estunom = find(strcmp([handles.estudiantes.Nombre],split(1)));
estuap = find(strcmp([handles.estudiantes.Apellido],split(2)));
elest = intersect(estunom,estuap)+1;
handles.estudiantes(elest) = [];
lista = cell(numel(handles.estudiantes));
for i = 2:numel(handles.estudiantes)
    lista{i-1} = [char(handles.estudiantes(i).Nombre) ' ' char(handles.estudiantes(i).Apellido)];
end
if sum(find(~cellfun(@isempty,lista))) > 0
    set(handles.lista_estudiantes,'String',lista);
else
    set(handles.lista_estudiantes,'String',{'No hay estudiantes'});
end

promedios = zeros(1,numel(handles.estudiantes));
for i = 2:numel(handles.estudiantes)
    promedios(i) = 0.6*handles.estudiantes(i).Nota_parciales + 0.25*handles.estudiantes(i).Nota_lab + 0.15*handles.estudiantes(i).Nota_proyecto;
end

h = histogram(promedios(2:end));
h.FaceColor = [0.8510 0.521 0.2314];
guidata(hObject, handles);


% --- Executes on button press in botondetalles.
function botondetalles_Callback(hObject, eventdata, handles)
% hObject    handle to botondetalles (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
nombre_completo = char(handles.lista_estudiantes.String(handles.lista_estudiantes.Value));
split = strsplit(nombre_completo,' ');
estunom = find(strcmp([handles.estudiantes.Nombre],split(1)));
estuap = find(strcmp([handles.estudiantes.Apellido],split(2)));
elest = intersect(estunom,estuap)+1;
prom = 0.6*handles.estudiantes(elest).Nota_parciales + 0.25*handles.estudiantes(elest).Nota_lab + 0.15*handles.estudiantes(elest).Nota_proyecto;
body = sprintf('Nombre: %s \nApellido: %s\nCodigo: %s\nNota parciales: %1.2f\nNota laboratorio: %1.2f\nNota proyecto: %1.2f',char(handles.estudiantes(elest).Nombre), char(handles.estudiantes(elest).Apellido), char(handles.estudiantes(elest).Codigo), handles.estudiantes(elest).Nota_parciales,handles.estudiantes(elest).Nota_lab,handles.estudiantes(elest).Nota_proyecto);
el_msg = msgbox(body, 'Informacion detallada', 'help');
guidata(hObject, handles);


% --- Executes on key press with focus on lista_estudiantes and none of its controls.
function lista_estudiantes_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to lista_estudiantes (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
