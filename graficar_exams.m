function graficar_exams( puntos_x, puntos_y, polinomios, handles )

%GRAFICAR_EXAMS hace una figura con tres subplots: el primero grafica los
%examenes y la aproximaci?n de temperatura, el segundo grafica los examenes
%y aproximacion de las presiones baja y alta, el tercero grafica los
%examenes y aproximaci?n de los examenes de latidos. 
xx = linspace(1,numel(puntos_x),100);
% Subplot de temperatura

plot(puntos_x, puntos_y{1},'*','Parent', handles.axes6);hold on % Grafica datos examenes temperatura.
k_1 = polyval(polinomios{1}, xx); % Usa polinomio para generar datos aprox de temperatura.
plot(xx, k_1,'Parent', handles.axes6);hold off % Grafica aproximaci?n examenes temperatura.
%disp(puntos_x); disp(puntos_y{1}); disp(polinomios{1});
disp(xx); disp(k_1);

% Subplot presi?n (baja y alta)

plot(puntos_x, puntos_y{2}, '*','Parent', handles.axes7);hold on% Grafica datos examenes presi?n baja
k_2 = polyval(polinomios{2}, xx);% Usa polinomio para generar datos aprox de presi?n baja.
plot(xx, k_2,'Parent', handles.axes7);hold off % Grafica datos examenes presi?n alta



k_3 = polyval(polinomios{3}, xx); % Usa polinomio para generar datos aprox de presi?n alta.
plot(puntos_x, puntos_y{3}, '*','Parent', handles.axes10);hold on % Grafica aproximaci?n examenes presi?n baja.
plot(xx, k_3,'Parent', handles.axes10);hold off % Grafica aproximaci?n examenes presi?n alta.

% Subplot de latidos
plot(puntos_x, puntos_y{4},'*','Parent', handles.axes9);hold on  % Grafica datos examenes temperatura.
k_4 = polyval(polinomios{4}, xx); % Usa polinomio para generar datos aprox de temperatura.
plot(xx, k_4,'Parent', handles.axes9);hold off % Grafica aproximaci?n examenes temperatura.

datacursormode on;


end