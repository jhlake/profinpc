function diff = diferencia(ecg, f)
%% Implementaci?n de la derivacion. 
% ecg es el vector del electrocardiograma.
% f es la frecuencia del electrocardiograma.
% ------ H(z) = (1/8T)(-z^(-2) - 2z^(-1) + 2z + z^(2)) --------- %
int_c = 4/(f*1/40);
b = interp1(1:5,[1 2 0 -2 -1].*(1/8)*f,1:int_c:5);
diff = filtfilt(b,1,ecg);
diff = diff/max(diff);