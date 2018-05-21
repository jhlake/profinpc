function [ p_temp, p_low, p_high, p_beats ] = polis_exams( dias, temp, low, high, beats )

%POLIS_EXAMS retorna un vector compuesto de 4 vectores. Cada uno de estos 4
%vectores corresponde a los coeficientes del polinomio obtenido de la
%interpolaci?n de los examenes de temperatura, presi?n baja, presi?n alta
%y latidos, en ese orden.

p_temp = mejor_interp(dias, temp);

p_low = mejor_interp(dias, low);

p_high = mejor_interp(dias, high);

p_beats = mejor_interp(dias, beats);

end

