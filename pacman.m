function varargout = pacman(varargin)
% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @pacman_OpeningFcn, ...
                   'gui_OutputFcn',  @pacman_OutputFcn, ...
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

	%% Import paths in order to use functions
    import_paths;


% --- Executes just before pacman is made visible.
function pacman_OpeningFcn(hObject, eventdata, handles, varargin)
    show_map(1); %Preview of the maze  
    
% --- Outputs from this function are returned to the command line.
function varargout = pacman_OutputFcn(hObject, eventdata, handles) 
    % Get default command line output from handles structure
    %varargout{1} = handles.output;

% --- Executes on button press in bt_play.
function bt_play_Callback(hObject, eventdata, handles)
    level = get(handles.level_popup, 'Value');
    map = get(handles.map_popup, 'Value');
    mute = get(handles.rb_mute, 'Value');

    %% START GAME
    play(level,map,mute)
   
% --- Executes on selection change in map_popup.
function map_popup_Callback(hObject, eventdata, handles)
    map = get(hObject, 'Value'); 
    show_map(map); %Preview of the maze.
    
% --- Executes during object creation, after setting all properties.
function map_popup_CreateFcn(hObject, eventdata, handles)
    % Hint: popupmenu controls usually have a white background on Windows.
    %       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end


% --- Executes on selection change in level_popup.
function level_popup_Callback(hObject, eventdata, handles)
    

% --- Executes during object creation, after setting all properties.
function level_popup_CreateFcn(hObject, eventdata, handles)
% hObject    handle to level_popup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in rb_mute.
function rb_mute_Callback(hObject, eventdata, handles)
% hObject    handle to rb_mute (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of rb_mute


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
help;
