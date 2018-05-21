function filtered = filtroP(ecg, f, interval, N)
%% Implementaci?n de un filtro promedio m?vil. 
% ecg es el vector del electrocardiograma.
% f es la frecuencia del electrocardiograma.
%interval es el n?mero m?ximo de medidas que tenemos (?ltimo segundo que se
%         toma en cuenta)
% N es el orden del filtro. N debe ser un n?mero impar.
filtered = zeros(1,interval); %Vector filtrado pre-declarado
for i = N:interval   %Primer ciclo, por cada valor en el vector filtrado.
    val = 0;
    for j=1:N    %Segundo ciclo, sumatoria para el filtro de los datos cercanos.
        index = (i*f)-(N-j)*f;
        val= val+ ecg(index);
    end
    filtered(i) = (val+ecg(i*f))/N; % Asignar valor a vector de filtro.
end
%filtered = filtered(N:interval); % Eliminar primeros valores, que son ceros.