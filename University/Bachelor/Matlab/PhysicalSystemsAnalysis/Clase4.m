Clase 4

Continuación de final de clase 3

function [Ke,Me,fg]=barra2D(ra,rb,k,m)
%Barra2D calcula:
%Ke: Matriz de rigidez de la barra
%Me: Matriz de masa
%fg: Fuerzas gravitatorias asociadas a la barra

%Variables de entrada:
%ra,rb:Vectores posición de los nodos A y B de la barra
%k: cte elática de la barra
%m: Massa de la barra

g=9.81;

AB=rb-ra;
c=AB(1)/norm(AB);
s=AB(2)/norm(aB);

A=[c^2 s*c; s*c s^2];
Ke=k*[A -A; -A A];

I=[1 0; 0 1]; %Tmabnien vale I=eye(2);
Me=m*[I I/2; I/2 I];

fg=m*g*[0; -1/2; 0; -1/2];

end

%Fin rutina ensamblaje y elemento 2D

