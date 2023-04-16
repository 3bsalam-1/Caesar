function varargout = caesar(varargin)
% CAESAR MATLAB code for caesar.fig
%      CAESAR, by itself, creates a new CAESAR or raises the existing
%      singleton*.
%
%      H = CAESAR returns the handle to a new CAESAR or the handle to
%      the existing singleton*.
%
%      CAESAR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CAESAR.M with the given input arguments.
%
%      CAESAR('Property','Value',...) creates a new CAESAR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before caesar_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to caesar_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help caesar

% Last Modified by GUIDE v2.5 17-May-2022 09:16:10

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @caesar_OpeningFcn, ...
                   'gui_OutputFcn',  @caesar_OutputFcn, ...
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


% --- Executes just before caesar is made visible.
function caesar_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to caesar (see VARARGIN)

% Choose default command line output for caesar
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes caesar wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = caesar_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function plaintext_Callback(hObject, eventdata, handles)
% hObject    handle to plaintext (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of plaintext as text
%        str2double(get(hObject,'String')) returns contents of plaintext as a double


% --- Executes during object creation, after setting all properties.
function plaintext_CreateFcn(hObject, eventdata, handles)
% hObject    handle to plaintext (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function k_Callback(hObject, eventdata, handles)
% hObject    handle to k (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of k as text
%        str2double(get(hObject,'String')) returns contents of k as a double


% --- Executes during object creation, after setting all properties.
function k_CreateFcn(hObject, eventdata, handles)
% hObject    handle to k (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function result_Callback(hObject, eventdata, handles)
% hObject    handle to result (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of result as text
%        str2double(get(hObject,'String')) returns contents of result as a double


% --- Executes during object creation, after setting all properties.
function result_CreateFcn(hObject, eventdata, handles)
% hObject    handle to result (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in enc_caesar.
function enc_caesar_Callback(hObject, eventdata, handles)
% hObject    handle to enc_caesar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
k=str2num(get(handles.k,'string'))
plaintext=get(handles.plaintext,'string')
        for i= 1:length(plaintext)
            %once he found a space, skip this iteration, ASCII of space=32
            if (plaintext(i)==32)
                plaintext(i)=32-k;
               
            end
            Ciphertext(i)=plaintext(i)+k;
            
            if Ciphertext(i) >122
               Ciphertext(i)=Ciphertext(i)-26;
            end
        end
        Ciphertext=upper(char(Ciphertext))
   set(handles.result,'string', Ciphertext)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
k=str2num(get(handles.k,'string'))
ciphertext=get(handles.ciphertext,'string')
    for i= 1:length(ciphertext)
                %once he found a space, skip this iteration, ASCII of space=32
                if (ciphertext(i)==32)
                    ciphertext(i)=(32-(23-k))-3;
                end

                 %using addition to find cipherletter "using ASCII code for letters"
                 %A=65  , Z=90
                plaintext(i)=ciphertext(i)-k;

                if plaintext(i) <65
                    plaintext(i)=plaintext(i)+26;
                end
     end
        plaintext=lower(char(plaintext));
        set(handles.result,'string', plaintext)


function ciphertext_Callback(hObject, eventdata, handles)
% hObject    handle to ciphertext (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ciphertext as text
%        str2double(get(hObject,'String')) returns contents of ciphertext as a double


% --- Executes during object creation, after setting all properties.
function ciphertext_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ciphertext (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


        
