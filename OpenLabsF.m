function varargout = OpenLabsF(varargin)
% OPENLABSF MATLAB code for OpenLabsF.fig
%      OPENLABSF, by itself, creates a new OPENLABSF or raises the existing
%      singleton*.
%
%      H = OPENLABSF returns the handle to a new OPENLABSF or the handle to
%      the existing singleton*.
%
%      OPENLABSF('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in OPENLABSF.M with the given input arguments.
%
%      OPENLABSF('Property','Value',...) creates a new OPENLABSF or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before OpenLabsF_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to OpenLabsF_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help OpenLabsF

% Last Modified by GUIDE v2.5 24-May-2018 22:17:42

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @OpenLabsF_OpeningFcn, ...
                   'gui_OutputFcn',  @OpenLabsF_OutputFcn, ...
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


% --- Executes just before OpenLabsF is made visible.
function OpenLabsF_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to OpenLabsF (see VARARGIN)

% Choose default command line output for OpenLabsF
handles.output = hObject;
stringlabs = varargin{1};
set(findobj('Tag','textas'),'String',strcat('Exam ID: ', stringlabs{1},' with result: ', stringlabs{2}));
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes OpenLabsF wait for user response (see UIRESUME)
% uiwait(handles.labsassign);


% --- Outputs from this function are returned to the command line.
function varargout = OpenLabsF_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
