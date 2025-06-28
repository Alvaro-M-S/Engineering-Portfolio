% Se construye un pilar de ancho 1 m
% y con N cuadrados (de lado 1 m)

close all, clear all

N=7 ; % Siete cuadrados, siete pisos

x=[]; y=[];
for p=1:(N+1)
    x=[ x ;    0  ;   1  ];
    y=[ y ; (p-1) ; (p-1)];
end

plot(x,y,'o'); grid on, axis equal

barras=[];
for p=1:N
    b1=5*(p-1)+1;
    n1=2*(p-1)+1;
    n0=n1-1;
    barras=[barras;
        n0+1 n0+2 ;
        n0+1 n0+3 ;
        n0+2 n0+4 ;
        n0+2 n0+3 ;
        n0+1 n0+4 ];
end

% Falta la barra superior horizontal
Nn=length(x);
barras=[ barras ;
         Nn-1  Nn];

Fijos=[ 0*x 0*y];
Fijos(1:2,:)=1; % Los nodos 1 y 2 están fijos

hold on

% for i=1:Nn
% plot(x(barras(i,1)),y(barras(i,1)),'r-')
% plot(x(barras(i,2)),y(barras(i,2)),'r-')
% end

Repre2D(x,y,barras,Fijos)

% x2=-y; y2=x; barras2=barras; Fijos2=Fijos;
% Repre2D(x2,y2,barras2,Fijos2)

%Creacion de un arco de radio medio R
% y ancho a

R=20;
a=2;
ro = R + (x-0.5)*a;
theta = y/max(y)*pi/2;

barras2=barras;
x2=ro.*cos(theta);

% for i=1:length(ro)
%     x2(i)=ro(i)*cos(theta(i));
% end  equivalenete a lo anterior

y2=ro.*sin(theta);

Repre2D(x2,y2,barras2,Fijos)

axis equal



