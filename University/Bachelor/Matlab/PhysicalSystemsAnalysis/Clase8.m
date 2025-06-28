%Clase 8

%comienza en clase 7 acabando las cargas en nodos

%Ejemplo 4 electrostatica (jvo_4)

%Usando el codigo de la clase 7 pero empleando el archivo JVO_4.xls

%Despues de leer el archivo se añade:

arc='JVO_4.xls'

%Datos relativos a la nube
Qo = -1; %Carga total en la nube (en C, unidad SI)
Ancho=14;
Alto= 2;
H=1;
rho_nube = Qo/(Ancho*Alto*H); %Densidad de carga en la nube
TipoNube=2; %Elementos y nodos pertenecientes a la nube

%Dentro del ensamblaje de los elemntos 
Habra esamblaje de la matriz capacidad C(ii,ii)

y tambien:
%Ensamblaje de las cargas eléctricas
if TipoMat(e)==TipoNube %Se comprueba si estamos dentro de la nube
    pe=[rho_nube; rho_nube
        
    %Ver ejemplo 4 en drive y diferencias coin el codigo de la clase 4
    
   
    
%Comienzo de transmision de calor

%Apuntes one note, teoria

%Funcion en one note rutina equivalente a electroestatica para calor

%Ver ejemplo Ladrillo


