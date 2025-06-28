%Clase 5

%Dos tipos de problemas:
% - Reg Permanente 
% - Modos normales de vibración

%Trabajando sobre Ejemplo de clase 3, añadiremos dinamica y borraremos lo
%que hay tras el ensamblaje de las matrices. Sustituyendolo por: (Tras
%apartado Aplicación de las condiciones de contorno


%Fuerza dinamica excitadora
%f(t) =fo*cos(wo*t)

%En el nodo 5 se introduce una fuerza horizontal de tipo oscilante con
%frecuencia angular wo
wo=2*pi*40; %40 Hz
fo=zeros(gdl,1);
fo(2*(5-1)+1)=100; %100 N en nodo 5 según x

%Solucion en régimen permanente
%Resolver: (-wo^2*M+K)*v=fo
v=(-wo^2+M+K)\fo;


%Alternativa=2;
switch Alternativa %En funcion del valor de alternativa ejecuta una u otra
    case 1
        %Representacion de la estructura en cos(wo*t)=1, osea cuando la deformación
%está al máximo

dx=v(1:2:end);
dy=v(2:2:end);
Amp= 100 %Factor de amplificación
Representa2D(x+Amp*dx,y+Amp*dy,barras) %Funcion usada con anterioridad en clases


    case 2
        figure
       %En Mooodle zip animaciones contiene rutinas con movimiento
 Represetna2Dmodo(x,y,barras,v,'EjemploDin.gif'); % para guardar el grafico en mov en un gif
 
end

%Investigación_ cómo varían las amplitudes de las oscilaciones al varias wo

wo=2*pi*[1:1:200];
Vmax=NaN(size(wo));
figure
for i=1:length(w0)
    v=(-wo(i)^2*M+K)\fo;
Vmax(i)=max(abs(v));
% plot(wo(i)/(2*pi),Vmax(i),'bo'); hold on, grid on
semilogy(wo(i)/(2*pi),Vmax(i),'bo'); hold on, grid on %Eje y logaritmico
%loglog Para los dos ejes logaritmicos
end

%Cambiamos la oscilacion de 40 a 13 Hz

%EjemploModosNormales, a partir de awqui trabajamos modificando lo anterior
%para hacer los modos normales de vibración. Como antes, partiendo del
%ejemplo de clase 3 quitando todo lo posterior a las condiciones de
%contorno

%Problema de valores y vectores propios:
% Lambda*v=A*v
%siendo 
% Lambda = w^2
% A = inv(M)*K
% v = descriptor del modo normal de vibracion
%
% q(t) = v*cos(w*t)

Alternativa=1;
switch Alternativa
    case 1
        A=inv(M)*K;
        [V,D]=eig(A); %eig saca los valores propios
        lambda=diag(D);
        w=sqrt(lambda);
        freq=w/(2*pi);
end

i=5; %Frecuencia elegida
v=V(:,i);
fi=freq(i)
Representa2Dmodo(x,y,barras,v,'ModoNormal')

%Para la reserva de memoria de las variables nhay otra opcion a la empleada
%en ejemlo
case 2
%Matrices dispersas
K=sparse(gdl,gdl);
M=K;
f=sparse(gdl,1);
%Otra opcion
case 3 %Matrices en la GPU, en la tarjeta gráfica. Matlab solo trabaja con NVIDIA
    K=zero(gdl,gdl,'gpuArray');
    M=zero(gdl,gdl,'gpuArray');
    f=zero(gdl,1,'gpuArray');
    