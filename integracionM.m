function mov = integracionM(ecg, interval, N)
%% Implementaci?n de la integraci?n m?vil. 
% ecg es el vector del electrocardiograma.
%interval es el n?mero m?ximo de medidas que tenemos (?ltimo segundo que se
%         toma en cuenta)
% N es el orden del filtro. N debe ser un n?mero impar.
mov = zeros(1,interval); %Vector filtrado pre-declarado
for i = N:interval   %Primer ciclo, por cada valor en el vector.
    val = 0;
    for j=1:N    %Segundo ciclo, sumatoria para el filtro de los datos cercanos.
        index = (i)-(N-j);
        val= val+ ecg(index);
    end
    mov(i) = (val+ecg(i)); % Asignar valor a vector de integraci?n
end
%mov = mov(N:interval); % Eliminar primeros valores, que son ceros.