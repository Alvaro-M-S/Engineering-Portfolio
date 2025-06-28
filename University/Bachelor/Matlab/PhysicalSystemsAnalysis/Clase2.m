%Clase2

% [-2:0.5_2]De -2 a 2 0.5 en 0.5
% CReando un vector para la incognita x y en la función operando con . hace
% la misma función que un bucle y dar valores

% close all 
% figure plot(x,y,'ro-') r de rojo, o de ciruclos en vez de x en los ptos,
% - unes los circulos con una linea
% grid on pone malla de fondo

% El paso entre el intervalo sería igual a la tolerancia o error, variarlo
% según lo que se busque

% Colores: r-red g-green b-blue c-cyan m-magenta y-yellow k-black w-white

% figure plot(x,y,'o-','color',[0.1 0.8 0.4]) expresando el color en RGB

% Para el ancho de linea: 'LineWidth', 3 es 3 puntos mas

% '--' linea de trazos ':' linea de puntos

% Para hacer distintos plots en la misma figura: hold on entre plot y plot
% y hold off borra la anterior

% Psrs poner leyrendas: xlabel('Eje x') y title('') para poner titulo

% a=axis devuelve los limites de los ejes

%a(-1)=valor cambia el limite a dicho valor

%Frozar a que las escalas sean iguales en ambos ejes: axis equal

%Resolucion de sistema de ecuaciones

%magic() crea matriz aleatoria 

%Matriz\vector para resolver sistema de ecuaciones

%Para sistema con mas numero de ecuaciones que incognitas, osea
%indeterminado: emplea ajuste por minimos cuadrados, minimizando error
%Para sist de menos ecuaciones que incognitas. Daria una solucion multiple
%pero \ da una de las minfinitas

%Tema 3

%Coordenadas de los nodos
%x=[0 10 0 10];
%y=[0 0 12 12];

%Barras (Matriz de conectividad con filas nºbarras y columnas nudos que la conforman)
%Intentar poner el nodo pequeño a la izq
%barras=[
%Nodo a   Nodo b
% 1         2; ...
% 1         3; ...
% 2         4; ...
% 2         3; ...
% 1         4; ...
% 3         4];

%Matriz fijos para fijar los gdl de cada nodo
%1 es fijo y 0 es libre, en este caso primera columna desplazamiento en x y
%la segunda en y
%Fijos=[
%1 1;
%1 1;
%0 0;
%0 0];

%Script para funcion
%function [loquedevuelve]=nombredelafuncion(x,y,barras,Fijos osea variables que usara internamente la funcion)
%figure
%plot(x,y,'bo') solo circulos en los nodos
%axis equal
%xlabel('X (m)')
%ylabel('Y (m)')
%holdon
%[numerobarrasonumerodefilas,nadaonumerodecolumnas]=size(barras);
%for b=1:numerobarras
%plot(x(barras(b,:)),y(barras(b,:)),'g'); saca coordenadas x e y de los
%dos nodos que forman el vector barra
%end
%nn=length(x);
% for n=1:nn;
%     if sum(Fijos(n,:))>0
%       plot(x(n),y(n),'ko'); circulos fijados en negro para diferenciar 
%     end
%
%end
%end

%Las unidades de las variables van a ser las del SI sin utilizar múltiplos
%ni submúiltiplos


%Tarea 1 Tema 3

%function [s,p]=sumaproducto(a,b)
%whos
%s=a+b;
%p=a*b;
% end

%Se construye un pilar de ancho 1 m y con N cuadrados (de lado 1m)
%close all, clear all
% N=7; Siete cuadrados, ciete pisos
% x=[]; y=[];
% for p=1:(N+1)
% x=[x; 0; 1];
% y=[y; (p-1); (p-1)];
% end
% plot(x,y,'o'); grid on
% axis equal
% barras=[];
% for p=1:N
% b1=5*(p-1)+1;
% n1=2*(p-1)+1;
% n0=n1-1;
%     barras=[barras;
% n0+1 n0+2;
% n0+1 n0+3;
% n0+2 n0+4;
% n0+2 n0+3;
% n0+1 n0+4];
% end
% % Faltaria la barra superior horizontal
% Nn=length(x);
% barras=[barras;
% Nn-1 Nn];

% Fijos=[0*x 0*y];
% Fijos(1:2,:)=1; Los nodos 1 y 2 están fijos
% Funcion de antes: funcion(x,y,barras,Fijos)

% kx=3; x=x*kx;para ensanchar;
% x=x-1.5 para centrar;
%Para rotar el pilar 90 grados: pasar de (x,y) a (-y,x)
%barras y fijos serian iguales

% Repre2D(x,y,barras,Fijos)
% 
% x2=-y; y2=x; barras2=barras; Fijos2=Fijos;
% Repre2D(x2,y2,barras2,Fijos2)




