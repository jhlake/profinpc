function [bpm, alert]=datapro(ecg)
%%Implementacion del metodo de Pan Tompkin propia.
%ecg vector de electrocardiograma.
%Devuelve:
%bpm que son los beats por minuto
%alert que es 1 si est?n por fuera del rango normal (60 a 100).

if ~isvector(ecg)
  error('ECG no es un vector culumna o fila.');
end
ecg = ecg(:); % vectorizar
% Declaraci?n de variables
f= 1;
N = 9;
factorCambio = 250/90000; 
intervals = floor(length(ecg)/f); % Intervalos de tiempo evaluados
t = linspace(1, 250, 90000); % Valores reales de tiempo que se evaluan.
% Procesamiento de datos
ecg_f = filtroP(ecg, f, intervals, N); % Filtrar con filtro de orden N.
ecg_d = diferencia(ecg_f, f); % Derivacion.
ecg_s = ecg_d.^2; % Cuadrado.
ecg_i = integracionM(ecg_s, length(ecg_s), N); % Integracion Movil.
% calcular picos QRS
[inds] = qrs(ecg_i,ecg_f);
% Mostrar senales
hFig = figure('Name', 'Se?ales procesadas');
set(hFig, 'Position', [10 10 1280 900]);
subplot(5,2,[1 2]);plot(t, ecg);axis tight; xlabel('Tiempo (segundos)'); ylabel('Amplitud (mV)'); title('Senal sin procesar');
subplot(5,2,[3 4]);plot(t, ecg_f);axis tight; xlabel('Tiempo (segundos)'); ylabel('Amplitud (mV)'); title('Senal con filtro');
subplot(5,2,[5 6]);plot(t, ecg_d);axis tight; xlabel('Tiempo (segundos)'); ylabel('Amplitud (mV)'); title('Senal con derivada');
subplot(5,2,[7 8]);plot(t, ecg_s);axis tight; xlabel('Tiempo (segundos)'); ylabel('Amplitud (mV)'); title('Senal cuadrada');
subplot(5,2,[9 10]);plot(t, ecg_i);axis tight; xlabel('Tiempo (segundos)'); ylabel('Amplitud (mV)'); title('Senal integrada');
%Graficar tacograma
taco(1:length(inds)-1) = (inds(2:end)-inds(1:end-1))*factorCambio;
tiempo = linspace(1,250,length(taco));
h2fig = figure('Name', 'Tacograma'); 
set(h2fig, 'Position', [1 1 1000 800]);
plot(tiempo, taco); axis tight; xlabel('Tiempo (segundos)'); ylabel('Int?rvalo RR'); title('Tacograma');
% Calcular el BPM
bpmve = zeros(1,length(taco));
for i = 1:length(taco) %Ciclo que calcula cada uno de los int?rvalo
    bpmve(i) = 60/taco(i);
end
bpm = (sum(bpmve)/length(bpmve)); % Promedio de los BPMs
alert = 0;
if(bpm < 60 || bpm > 100) % Caso anormal
   alert = 1; 
end
figure('Name', 'Gr?fica de Beats.'); 
plot(tiempo,bpmve); axis tight; xlabel('Tiempo (segundos)'); ylabel('N?mero de Latidos (BPM)'); title('Latidos por minuto');