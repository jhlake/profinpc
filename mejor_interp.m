function [ el_poli ] = mejor_interp( X, Y )

%MEJOR_INTERP retorna un vector con los coeficientes del polinimio obtenido de la mejor
%interpolaci?n posible usando el m?todo de least-squares.

opciones_grado = length(Y) - 5;
min_err = Inf;

for i = 1:opciones_grado
    
    poli_y = polyfit(X, Y, i);
    graf_y = polyval(poli_y, X);
    err = zeros(opciones_grado);
    err(i) = sum(abs(graf_y(1:end)-Y(1:end)));
    
    if err(i) < min_err
        
        el_mejor = i;
        min_err = err(i);
    end
    
end

el_poli = polyfit(X, Y, el_mejor);

end

