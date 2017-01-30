function varargout = help(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @help_OpeningFcn, ...
                   'gui_OutputFcn',  @help_OutputFcn, ...
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


% --- Executes just before help is made visible.
function help_OpeningFcn(hObject, eventdata, handles, varargin)
% Choose default command line output for help
handles.output = hObject;
str = {'', ... 
        strcat('Use the arrow keys to change pacman', 's direction.')  ...
        '', ...    
        'Use the [ESC] to quit,', ...
        '', ... 
        'MAE-2016 PACMAN'};
    
set(handles.help_text, 'String', str);
set(hObject, 'Name','HELP');

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes help wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% --- Outputs from this function are returned to the command line.
function varargout = help_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in bt_Close.
function bt_Close_Callback(hObject, eventdata, handles)
    close;
