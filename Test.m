
%opts = detectImportOptions('Angel_Barreto_Miguel_Walter.txt');
%opts.Delimiter = {'\t', '\t\t', ' '};


% cosas = readtable('Angel_Barreto_Miguel_Walter.txt');
% 
% cositas = (1:numel(cosas.Var1))';
% 
% exams = {cosas.Var4;cosas.Var5;cosas.Var6;cosas.Var7};
% [p1,p2,p3,p4] = polis_exams(cositas,cosas.Var4,cosas.Var5,cosas.Var6,cosas.Var7);
% polis = {p1;p2;p3;p4};
% 
% %plot(cositas, exams(1),'o')
% 
% graficar_exams(cositas, exams, polis);



% h = uicontrol('Style', 'pushbutton', 'Position', [20 150 100 70]);
% uicalendar('DestinationUI', {h, 'String'});


% fid = fopen('1.bin');
% ecg = fread(fid, 'single');
% fclose(fid);
% 
% b0 = 0.95; b1 = 0.001; b2 = 0.0002; c1 = 0.05; c2 = 0.04; rb = 33.33;
% 
% 
% F = @(t,y) [b0 + b1*y(1) - b2*y(1)*y(2);...
%             -c1*y(2) + c2*rb];
%         
% y0 = [90;10];
% 
% tspan = 1:500;
%         
% [TOUT, YOUT] = ode45(F, tspan, y0); 
% plot(TOUT, YOUT);
% datacursormode on
uicalendar('DestinationUI', x);




