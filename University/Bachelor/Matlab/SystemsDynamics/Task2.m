function [MisDatos, Gba, Gbc, Gper, Gbc_ret, medidas] = practicaDS2()

disp('Álvaro Morales Sánchez - 18240');
disp('Los resultados de la función se muestran a continuación:');

%Variables y datos
g=9.8;
A1=1.4;
a1=0.1;
A2=2.9;
a2=0.25;
qe1=0.6;
Tau=3.5;
h1o=((qe1/a1)^2)*(1/2*g);
qs1o=qe1;
h2o=((qe1/a2)^2)*(1/2*g);
qe2=qs1o;
qs2o=qe2;
aux11=sqrt(2*g*h1o);
aux12=(a1*sqrt(2*g))/(2*sqrt(h1o));
aux21=sqrt(2*g*h2o);
aux22=(a2*sqrt(2*g))/(2*sqrt(h2o));


%Se muestran mis datos
MisDatos.nombre='Alvaro';
MisDatos.apellidos='Morales Sanchez';
MisDatos.nmat=18240;
MisDatos.parametros=[A1 a1 A2 a2 qe1 Tau];
MisDatos.horas=10;

%Calculos y pasos intermedios

gdd=tf(1, [A1 0]);
Gd111=feedback(gdd, aux12);
gdd=tf(1, [A1 0]);
Gd112=(-aux11)*feedback(gdd, aux12);
gdd=tf(1, [A1 0]);
Gd121=(aux12)*feedback(gdd, aux12);
gdd=tf([(A1*aux11) 0], [A1 0]);
Gd122=feedback(gdd, aux12);

gdd=tf(1, [A2 0]);
Gd211=feedback(gdd, aux22);
gdd=tf(1, [A2 0]);
Gd212=(-aux21)*feedback(gdd, aux22);
gdd=tf(1, [A2 0]);
Gd221=(aux22)*feedback(gdd, aux22);
gdd=tf([(A2*aux21) 0], [A2 0]);
Gd222=feedback(gdd, aux22);

Gba11=Gd121*Gd211;
Gba12=Gd122*Gd211;
Gba21=Gd121*Gd221;
Gba22=Gd122*Gd221;

%Matriz Gba
Gba=[Gba11 Gba12; Gba21 Gba22];

%Nuevas funciones de transferencia
k=1;
Gbc=minreal(feedback(k*Gba11,1));

Gper=minreal(Gba12);

ret=tf(1,1,'IODelay',Tau);
ret_aprox=pade(ret,1);
Gba11ret=Gd121*ret_aprox*Gd211;
Gbc_ret=minreal(feedback(k*Gba11ret,1));

%Simulación
figure;
subplot(2,2,1);
step(h2o+(Gbc*(0.1*h2o)));
grid;
xlabel('Tiempo');
ylabel('H2');
title('Evolución H2 (aumento 10% Href)');
subplot(2,2,2);
step(h2o+(Gper*(0.1*a1)));
grid;
xlabel('Tiempo');
ylabel('H2');
title('Evolución H2 (aumento 10% a1)');
subplot(2,2,[3,4]);
step(h2o+(Gbc_ret*(0.1*h2o)));
grid;
xlabel('Tiempo');
ylabel('H2');
title('Evolución H2 (aumento 10% Href + retardo)');


%Estructura medidas (sistema retardo)

info=stepinfo(Gbc_ret,'SettlingTimeThreshold',0.05,'RisetimeLimits',[0 1]);

medidas.tr=info.RiseTime;
medidas.ts=info.SettlingTime;
medidas.Mp=info.Overshoot;

%Estos datos también se pueden obtener a partir de la gráfica, cambiando
%los intervalos y porcentajes pedidos.

%Fin Tarea
end

