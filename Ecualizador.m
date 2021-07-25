function varargout = Ecualizador(varargin)
% ECUALIZADOR MATLAB code for Ecualizador.fig

% Last Modified by GUIDE v2.5 09-Nov-2018 21:26:15

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Ecualizador_OpeningFcn, ...
                   'gui_OutputFcn',  @Ecualizador_OutputFcn, ...
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


% --- Executes just before Ecualizador is made visible.
function Ecualizador_OpeningFcn(hObject, ~, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Ecualizador (see VARARGIN)

% Choose default command line output for Ecualizador
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Ecualizador wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Ecualizador_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
SLIDER=get(hObject,'Value');
set(handles.text3,'String',SLIDER);



function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
%llamado al valor del slider y guardado en la variable SLIDER
SLIDER=get(hObject,'Value');
%Envio y muestra del valor de la variable Slider a texto 4
set(handles.text4,'String',SLIDER);


% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider3_Callback(hObject, eventdata, handles)
%llamado al valor del slider y guardado en la variable SLIDER
SLIDER=get(hObject,'Value');
%Envio y muestra del valor de la variable Slider a texto 5
set(handles.text5,'String',SLIDER);


% --- Executes during object creation, after setting all properties.
function slider3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider4_Callback(hObject, eventdata, handles)
%llamado al valor del slider y guardado en la variable SLIDER
SLIDER=get(hObject,'Value');
%Envio y muestra del valor de la variable Slider a texto 6
set(handles.text6,'String',SLIDER);


% --- Executes during object creation, after setting all properties.
function slider4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider5_Callback(hObject, eventdata, handles)
%llamado al valor del slider y guardado en la variable SLIDER
SLIDER=get(hObject,'Value');
%Envio y muestra del valor de la variable Slider a texto 7
set(handles.text7,'String',SLIDER);

% --- Executes during object creation, after setting all properties.
function slider5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
 global  Y FS  filename
%  

%obtencion del nombre y ubicacion del archivo de audio
[nombredeA,direcciondeA]=uigetfile('.mp3','seleccione un archivo de audio');

filename=(strcat(direcciondeA,'/',nombredeA));
%lectura del audio por medio de la funcion audioread y obtencion de la
%frecuencia y Y
[Y,FS]=audioread(filename);
%Obtecion del tamaño de la señal
T=length(Y);
%FN variable que permitira calcular todos los exponentes de 2, de la
%variable T, para calcular mucho mas rapido la transformada rapida de
%fourrier, para graficas en frecuencia
  FN=2^nextpow2(T);
  %creacion del vector tiempo, que inicia en 1 hasta el valor de T
  t=1:T;
  %creacion de la variable n, para el eje x de las graficas en transformada
  %de fourrier
  n=FS*linspace(0,1,FN/2+1); 
  %conversion del vector t a tiempo en segundos del audio
  Tt=(t*2)/100000;
  %Transformada rapida de fourrier de la señal del audio, para mostrar
  %grafica en frecuencia
  Originaltff=fft(Y,FN)/T;
  %llamado del axes 3 de la guide, para graficacion de la señal,tanto
  %normal y en fourrier
axes(handles.axes3);
plot(Tt,Y,'blue');
axes(handles.axes4);
plot(n,2*abs( Originaltff(1:FN/2+1)),'red');
%calculo del tamaño del audio y obtencion de este en valor entero, para
%reutilizarlo en las condiciones del ciclo for

TT=floor((T*2)/100000)+2;

%calculo de numero de segmentos a tomar del audio, ya que se manejara por
%trozos, para mejor analisis y poder mostrarlo en tiempo real
numerosegmentos=floor(TT/22);

%ya que en ciertos valor de segmentos dan cero y no inicia la reproduccion,
%se convierte el cero en 1
if(numerosegmentos==0)
  numerosegmentos=1;  
end

%se vacia las variables

clear T FN t n
%inicio del ciclo for por intervalos, el cuando se incrementara
for x=1:(numerosegmentos*FS-1):(TT*FS)*22
    %obtencion de los valors que tienen los slider en la interfaz grafica
B1= get(handles.slider1,'value');

B2= get(handles.slider2,'value');
B3= get(handles.slider3,'value');
B4= get(handles.slider4,'value');
B5= get(handles.slider5,'value');
%conversion de los valores de los slider a ganancias
B1=10^(B1/20);
B2=10^(B2/20);
B3=10^(B3/20);
B4=10^(B4/20);
B5=10^(B5/20);
%Xaux permitira cambiar el intervalo en el cual se lee el audio

Xaux=x+numerosegmentos*FS;


%creacion del intervalo 
intervalo = [x,Xaux];

%limpieza de variables

%lectura del audio en el intervalo establecido
[Y,FS]=audioread(filename,intervalo);
  T=length(Y);
  FN=2^nextpow2(T);
  t=1:T;

  Ttaux=(t*2)/100000;

  n=FS*linspace(0,1,FN/2+1); 
%Si la ganancia de los slider es cero, con esta condicional, grafica y
%reproduce el sonido original
if(B1==1&&B2==1&&B3==1&&B4==1&&B5==1)
OriginalSff=fft(Y,FN)/T;
axes(handles.axes1);
plot(Ttaux,Y,'blue');
axes(handles.axes2);

plot(n,2*abs( OriginalSff(1:FN/2+1)),'red');
A=audioplayer(Y,FS);
play(A);
pause(numerosegmentos);

%Si los valores de ganancia de los slider son diferentes de cero o iguales a 1, ya que no todas las ganacias cambian,
%aplica el filtro a la señal con su respectiva ganancia
else
 
%Asignando y llamando los filtros creados con el fdatool
 Altas=filtroA;
 
%Aplicacion del filtro
Y1=B1*filter(Altas,Y);
%Transformada rapida de fourrier para el filtro Y1
AsubF=fft(Y1,FN)/T;
% %%
% %Asignando y llamando los filtros creados con el fdatool
 Grave=FGrave;
% 
% %Aplicacion del filtro
 Y2=B2*filter(Grave,Y);
 %Transformada rapida de fourrier para el filtro Y2
AuGraF=fft(Y1,FN)/T;
% %%
% %Asignando y llamando los filtros creados con el fdatool
Fbajas=FMediasBajas;
% 
% %Aplicacion del filtro
 Y3=B3*filter(Fbajas,Y);
 %Transformada rapida de fourrier para el filtro Y3
 AbajasF=fft(Y3,FN)/T;
% %%
% %Asignando y llamando los filtros creados con el fdatool
MediasAltas=FMediasAltas;
% 
% %Aplicacion del filtro
Y4=B4*filter(MediasAltas,Y);
%Transformada rapida de fourrier para el filtro Y4
 AaltaF=fft(Y4,FN)/T;
% %Asignando y llamando los filtros creados con el fdatool

Brillo=FBrillo;

%Aplicacion del filtro
Y5=B5*filter(Brillo,Y);
%Transformada rapida de fourrier para el filtro Y1
AuBrilloF=fft(Y5,FN)/T;

%Sumatoria de la señal pasada por todos los filtros.
ff=AsubF+AuGraF+AbajasF+AaltaF+AuBrilloF;%
%Sumatoria de la señal pasada por todos los filtros, despues transformada rapida de fourrier.
YF=Y1+Y2+Y3+Y4+Y5;%


%llamado de los axis y muestra de la señal filtrada
axes(handles.axes1);
plot(Ttaux,(YF),'blue');
%llamado de los axis y muestra de la señal filtrada fourrier
axes(handles.axes2);
plot(n,2*abs(ff(1:FN/2+1)),'red');
%reproduccion de la señal filtrada, utilizando la frecuencia original y la
%señal filtrada
A=audioplayer((YF),FS);
play(A);
%fin condicional
end
 clear Y1 Y2 Y3 Y4 Y5 AsubF AuGraF AbajasF AaltaF AuBrilloF
%se pausa, para que se pueda escuchar mejor el audio
pause(0.1);

%fin ciclo for y pausa de este para que se escuche la muestra del audio
%filtra

end


% --- Executes on button press in pushbutton3.

