%Clase 3

% save prueba guarda en un archivo lo que hay en la memoria de una funcion

% global varibale para que dicha variable sea global y sea igual en todas
% las memorias

%Usar polares para arco
%Ver funcion pilar tras clase 3 y funcion Repre2D de clase 2

%Copiar imagen mone note, abrir plantilla excell onenote y guradar en
%directorio, pegar imagen en excel, pasar a las tablas coordenas etc,
%cuidado coma decimal en excel es separador en matlab, pasar datos
%problema, raiz(2) en la loo de las barras oblicuas, 

%Funcion que lea la plantilla: 
function [x,y,Fijos,mn,fx,fy , barras,mb,k,loo]=LeeEstru2D(nombre)

%Variables de salida para los nodos
%x,y: coordenadas x,y
%Fijos: Matriz Nnx2 indicando los grados de libertad que son fijos
%m: masa de cada nodo
%fx,fy: Fuerzas aplicadas según x e y en cada nodo

%Variables de salida para las barras
%barras:Matriz Nbx2 de conectividad de las barras
%mb: Masas de las barras
%k: constante elástica de las barras
%loo: longitud natural de las barras

data=xlsread(nombre,'nodos');
x=data(:,2);
y=data(:,3);
mn=data(:,5);
fx=data(:,6);
fy=data(:,7);
Fijos=data(:,8:9);


data=xlsread(nombre,'barras');
barras=data:,2:3);
mb=data(:,5);
k=data(:,6);
loo=data(:,7);

end


%Progrma Ejemplo.m que resuelve la estructura 2D definida en Ejemplo.xls

clear all, close all, clc

%Constantes a utilizar
g=9.7995;


xls='ejemplo.xls'

[x,y,Fijos,mn,fx,fy , barras,mb,k,loo]=LeeEstru2D(xls);

%Variables de los nodos
%x,y: coordenadas x,y
%Fijos: Matriz Nnx2 indicando los grados de libertad que son fijos
%m: masa de cada nodo
%fx,fy: Fuerzas aplicadas según x e y en cada nodo

%Variables de las barras
%barras:Matriz Nbx2 de conectividad de las barras
%mb: Masas de las barras
%k: constante elástica de las barras
%loo: longitud natural de las barras

Nn=length(x); %numero de nodos
Nb=length(k); %numero de barras
gdl=2*Nn; %numeor de gdl

%Rutina en onenote Represeta2D para represetnar barras y ademas numeros

figure
Representa2D(x,y,barras);


%Calculo a traves de energias potenciales: Uelastica+Un(F*q, de cada barra)
%Concatenar fuerza fx1,fy1,.. (tantos como gdl) y desplaxazamientos x1,y1,x2,y2...llamado q
%Ver foto

%Reserva de memoria para las variables del problema
K=zeros(gdl,gdl); %Matriz de rigidez
M=zeros(gdl,gdl);%Matriz de Masa

f=zeros(gdl,1); %Vector de fuerzas

f(1:2:end)=f(1:2:end)+fx;
f(2:2:end)=f(2:2:end)+fy;
f(2:2:end)=f(2:2:end)-mn*g;

%Se continuara la semana que viene

%Continuacion de la clase 4

%Ensambleje de las barras (Ver funcion clase 4

for e=1:Nb
 a=barras(e,1);
 b=barras(e,2);
 ra=[x(a) y(a)];
 rb=[x(b) y(b)];
 [Ke,Me,fg]=barra2D(ra,rb,k(e),mb(e));
 
 ii=[2*(a-1)+1 2*(a-1)+2 2*(b-1)+1 2*(b-1)+2];
 
 %Ensamblaje
 K(ii,ii)=K(ii,ii9)+Ke;
 M(ii,ii)=M(ii,ii9)+Me;
 f(ii)=f(ii)+fg;
 
end
%Aplicación de las condiciones de contorno
Kmax=max(abs(K(:)));
Kinf=1e8*Kmax;
fijos=NaN(gdl,1);
fijos(1:2:end)=Fijos(:,1);
fijos(2:2:end)=Fijos(:,2);
for i=1:gdl
    if fijos(i)==1
    K(i,i)=K(i,i)+Kinf;
    end
end
%Resolucion del problema estatico
q=K\f;

%Representacion gráfica del resultado
dx=q(1:2:end);
dy=q(2:2:end);
Amp=100;
figure
Representa2D(x+Amp*dx,y+Amp*dy,barras)%Funcion de clase

%eig(K) para valores propios

lambda=eig(K);

%El valor propio más pequeño positivo dice que es estable y cuanto mas pequeño mayor la prob de que se caiga la est

disp('  ');
disp('Desplazamiento de los nodos:');
for i=1:Nn
    s=sprintf('Nodo nº %2.0f : dx= %7.3f mm  dy= %7.3f mm',i,dx(i)*1000,dy(i)*1000);
    disp(s);
end 
%Calculo de las reacciones
r=zeros(gdl,1);
for i:gdl
    if fijos(i)==1
        r(i)=-Kinf*q(i);
    end 
end
Rx=r(1:2:end);
Ry=r(2:2:end);

disp('  ');
disp('Reacciones en los nodos:');
for i=1:Nn
    s=sprintf('Nodo nº %2.0f : Rx= %6.1f N Ry= %6.1f N',i,Rx(i),Ry(i));
    disp(s);
end

%Calculo de las tensiones de las barras
T=NaN(Nb,1);
for e=1:Nb
     a=barras(e,1);
 b=barras(e,2);
 ra=[x(a) y(a)];
 rb=[x(b) y(b)];
 l1=norm(rb-ra); %long antes de deformarse
 
  ra=[x(a)+dx(a) y(a)+dy(a)];
 rb=[x(b)+dx(b) y(b)+dy(b)];
 l2=norm(rb-ra); %Long. desp de deformarse
 
 T(e)=k(e)*(l2-l1);
end

%spy(K) para que señale con punto los valores distintos de cero de la
%matriz K

%K(:) reorganiza la información de una matriz en un vector columna


%En onenote la funcion Repre2DT representa las tensiones con colores a
%partir de la funcion de matlba jet

T
figure
Representa2DT(x+Amp*dx,y+Amp*dy,barras)

