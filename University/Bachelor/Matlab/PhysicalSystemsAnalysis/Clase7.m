%Clase 7

% Electrostática en 2D

%Ecuaciones maxwell. Dandole una vuelta, evitando derivadas L=T-U=min/mx
%(Lagrangiana)
%L resultante en un prob electro: L=1/2 epsilon E^2 - energía asociada a
%cargas libres (phi, o u)

%Buscando que sea minimo o maximo se resuelve el problema

%L=1/2*ut*C*u - qtu siendo q las cargas libres (formula similar a la de
%energia pontencial en barras)

%KelecT2D rutina donde se unifica toda la info de electroestatica

%Comienzo de resolución de problemas

%Materiales (En excel)
%Númeropunto x y 0 1 (Material tipo 1= aire)

%Script resolución ejemplo 1 de Electroestatica
%archivo Ejemplo_1.xls

%close all,clear all, fclose all;

%co=299792458 %velocidad de la luz (SI)
%mu_o=4e-7*pi %Permeabilidad magnética del vacío (SI)
%eps_o=1/co^2/mu_o; %Permitividad eléctrica del vacío (SI)

%Tipos de materiales (Base de datos)
%Material=[
%Tipo eps (SI)
% -1   eps_o        ; %el vacio
%  1   1.000521*eps_o  ;%aire
%  2   1.000521*eps_o  ;%aire


%  4   5.4*eps_o      ;%Mica/Vidrio
%  5   35*eps_o      ; %PVC
%];

%arc='Ejemplo_1.xls'; %Malla del problema
%[]=LeerElec2D(arc); %Lectura del archivo
%n=length(x); %Número de nodos
%Ne=length(Conec(:,1)); %Número de elementos

%Inicialiciación de las variables del problema
Alternativa=1;
switch Alternativa
    case 1 %Matrices densas
        C=zeros(n,n); %Matriz de capacidad
        B=zeros(n,n) %Matriz B global
        q=zeros(n,1) %Vector global de cargas concentradas en los nodos
     case 2 %Igual con matrices dispersas
        C=sparse(n,n); %Matriz de capacidad
        B=sparsee(n,n) %Matriz B global
        q=sparse(n,1) %Vector global de cargas concentradas en los nodos
    case 3
        %Para usar la tarjeta gráfica
end

  %Ensamblaje de los elementos
for e=1:Ne
   %Características del material
   k=find(TipoMat(e)==Material(:,1));
   eps=Material(k,2); %eps del material del elemento nºe
   
   ii=Conec(e,:); %Nodos del elemento triangular
   [Ce,Be,M]=KelecT2D(x(ii),y(ii),eps); %Física del problema
   
   C(ii,ii)=C(ii,ii)+Ce;
   B(ii,ii)=B(ii,ii)+Be;
    %Faltarían cargas pero en este primer ejemplo no hay
        
end    

Co=C; qo=q; %Valores de C y q antes de aplicar las condiciones de contorno

%Asignacion del Cinf
Cmax=max(abs(C(:)));
Cinf=1e8*Cmax;

%Introducción de las condiciones de contorno
Vint=1;
Vext=0;

%Contorno exterior
ii=find((TipoNodo==1)|(TipoNodo==2)|(TipoNodo==2));
q(ii)=q(ii)+Cinf*Vext;
for j=1:length(ii)
    k=ii(j);
    C(k,k)=C(k,k)+Cinf;
end
%Contorno Interior
ii=find((TipoNodo==4));
q(ii)=q(ii)+Cinf*Vint;
for j=1:length(ii)
    k=ii(j);
    C(k,k)=C(k,k)+Cinf;
end

%Resolución del problema: C*u=q
u=C\q; %Vector con los potenciales en los nodos de la malla

%Representación gráfica del potencial
figure
trisurf(Conec,x,y,u);
xlabel('X (m)'); ylabel('Y(m)');zlabel('Potencial u(V)');
axis equal
title('Potencial u (V)');
% view(2); ver desde arriba
colorbar
% shading interp

%Cálculo y representación del campo eléctrico
Ex=Nan(Ne,1); Ey=NaN(Ne,1); 
xc=NaN(Ne,1); yc=NaN(Ne,1); %Centros de los triángulos


for e=1:Ne
 %Características del material
   k=find(TipoMat(e)==Material(:,1));
   eps=Material(k,2); %eps del material del elemento nºe
   
   ii=Conec(e,:); %Nodos del elemento triangular
   [Ce,Be,M]=KelecT2D(x(ii),y(ii),eps); %Física del problema
   
   %Cálculo del vector E
   E=M*u(ii);
   Ex(e)=E(1);
   Ey(e)=E(2);
   
   %Coordenadas de los centros de los triángulos
   xc(e)=mean(x(ii));
   yc(e)=mean(y(ii));
end

%Representacion del campo electrico

figure
quiver(xc,yc,Ex,Ey);
xlabel('X(m)');ylabel('Y(m)');
title('Campo Eléctrico');

axis equal

%Faltarian las cargas libres de los bordes o conductores

%De la clase 8

%Cargas y densidades de carga que aparecen en los nodos
q2 = Co*u; %Cargas concentradas en los nodos (en culombios C)
p = B\q2; %Densidades de carga en los nodos (en C/m3)


%Represetnacion de las csargas concentrsdas en cada nodo

figure
stem3(x,y,q2);
xlabel('X(m)');ylabel('Y(m)');zlabel('Carga q (C)');

%Representacion de la densidad de carga
figure
trisurf(Conec,x,y,p*1e9);
xlabel('X(m)');ylabel('Y(m)');zlabel('Densidad de carga \rho (nC/m3)');
axis equal
title('Densidad de Carga');


%Representacion de la densidad de carga en 2D
figure
trisurf(Conec,x,y,p*1e9);
xlabel('X(m)');ylabel('Y(m)');zlabel('Densidad de carga \rho (nC/m3)');
axis equal
title('Densidad de Carga');
view(2)
colorbar
shading interp







