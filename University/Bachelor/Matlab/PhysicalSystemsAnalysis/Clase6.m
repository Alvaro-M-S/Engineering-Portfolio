%Clase 6 Elementos Finitos

% Triangulos

%Si ek=-1 es que un triangulo del easymesh no tiene triangulo contiguo

%system('EasyMesh_win') %para ejecutar o llamar al easymesh sin tirar del
%cmd

%Ejmplo de Moodle

%Dependiendo del sentido del mallado, se si hay material dentro o no

%Definimos en el excel el conterono exterior tanto en nodos como segmentos

%Ver excel prueba2 de clase

%arc='Prueba2.xls'; EasyMesh(arc,true);

%Para la frontera 2-5 solo hay que crear un segmento ya que emplea nodos ya
%definidos

%Para el agujero recorrer en sentido antihorario para que reconzca que su
%interior esta vacio. Por tanto tanto nodos como segmentos siguen ese orden
%a la hora de definirlos

%Asignacion del material

%Tamaño triangulo 0 para poner un marcador
%Para el material coger puntos arbitrarios de cada zona poner tamaño de
%triang cero y poner el tipo de material en la ultima columna. Despues
%poner la fila coloreada, aunque matlab poner otros colores




