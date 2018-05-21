function graficar_exams( puntos_x, puntos_y, polinomios )

%GRAFICAR_EXAMS hace una figura con tres subplots: el primero grafica los
%examenes y la aproximaci?n de temperatura, el segundo grafica los examenes
%y aproximacion de las presiones baja y alta, el tercero grafica los
%examenes y aproximaci?n de los examenes de latidos. 
xx = linspace(1,numel(puntos_x),100);
% Subplot de temperatura
subplot(1,3,1);
plot(puntos_x, puntos_y{1},'*');hold on % Grafica datos examenes temperatura.
k_1 = polyval(polinomios{1}, xx); % Usa polinomio para generar datos aprox de temperatura.
plot(xx, k_1);hold off % Grafica aproximaci?n examenes temperatura.
%disp(puntos_x); disp(puntos_y{1}); disp(polinomios{1});
disp(xx); disp(k_1);

% Subplot presi?n (baja y alta)
subplot(1,3,2);
plot(puntos_x, puntos_y{2}, '*');hold on % Grafica datos examenes presi?n baja
plot(puntos_x, puntos_y{3}, '*'); % Grafica datos examenes presi?n alta

k_2 = polyval(polinomios{2}, xx); % Usa polinomio para generar datos aprox de presi?n baja.
k_3 = polyval(polinomios{3}, xx); % Usa polinomio para generar datos aprox de presi?n alta.

plot(xx, k_2); % Grafica aproximaci?n examenes presi?n baja.
plot(xx, k_3);hold off % Grafica aproximaci?n examenes presi?n alta.

% Subplot de latidos
subplot(1,3,3);
plot(puntos_x, puntos_y{4},'*');hold on  % Grafica datos examenes temperatura.
k_4 = polyval(polinomios{4}, xx); % Usa polinomio para generar datos aprox de temperatura.
plot(xx, k_4);hold off % Grafica aproximaci?n examenes temperatura.



end

