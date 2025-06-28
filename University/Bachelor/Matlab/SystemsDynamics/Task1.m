function [MisDatos, PE, Gd1, Gd2, Gba, Prop1, Prop2] = practicaDS1()

disp('Álvaro Morales Sánchez - 18240');
disp('Los resultados de la función se muestran a continuación:');

% Nota: no sabía exactamente si en MisDatos.parametros
% había que meter los resultados o las variables.

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

polos1=pole(Gba11);
ceros1=zero(Gba11);
ke1=dcgain(Gba11);

polos2=pole(Gba12);
ceros2=zero(Gba12);
ke2=dcgain(Gba12);

%Se muestran mis datos:
MisDatos.nombre='Alvaro';
MisDatos.apellidos='Morales Sanchez';
MisDatos.nmat=18240;
MisDatos.parametros=[A1 a1 A2 a2 qe1 Tau];
MisDatos.horas=8;

%Se muestra el punto de equilibrio:
PE=[h1o, qs1o, h2o, qs2o];

%Las matrices y funciones halladas:
Gd1=[Gd111 Gd112; Gd121 Gd122];

Gd2=[Gd211 Gd212; Gd221 Gd222];

Gba=[Gba11 Gba12; Gba21 Gba22];

%Polos, ceros y ganancia de Gba11:
Prop1.polos=[polos1(1) polos1(2)];
Prop1.ceros=ceros1;
Prop1.Ke=ke1;
%Polos, ceros y ganacia de Gba12:
Prop2.polos=[polos2(1) polos2(2)];
Prop2.ceros=ceros2;
Prop2.Ke=ke2;

%Simulación
figure;
subplot(1,2,1);
step(h2o+Gba11*(0.1*qe1));
grid;
xlabel('Qe1');
ylabel('H2');
subplot(1,2,2);
step(h2o+Gba12*(0.1*a1));
grid;
xlabel('a1');
ylabel('H2');

%Fin Tarea
end

