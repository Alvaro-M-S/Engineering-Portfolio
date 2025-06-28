%Primera clase

%diary on guarda el diario, guarda las lineas de comando en un archivo de texto
%whos para ver las variables y tipo guardadas
%length para vector
%size para matriz
%para enteros usar int seguido de los bytes del tamaño
%uint para enteros sin signo
%complex variable para numeros complejos complex(parte entera,imaginario)
%== comparar igualdad, da variable lógica de 1 byte
%not() negación logica 
%; en vectores salto de fila
%rand genera numeros aleatorios
%; ... a parte de saltar de fila te ayuda a escribirlo en forma matricial
%magic genera matrices magicas de las dimensiones metidas en () seguido
%extraer una submatriz i=[3:5] j=[7:9] y A(i,j) 
%: es de lo de la izq a lo de la dcha de uno en uno
%zeros() crea matriz de nxn
%B(i,j)=B(i,j)+Bp sumar a una submatriz una del mismo tamaño externa
%concatenacion de vectores: C=[ a b ], siendo a y b vectores filas o
%columnas pero mismo orden (con columnas poner ; para que salga columna)
%' traspuesto
%concatenación de matrices: similar pero cuidado con los ordenes para la
%concatenacion
%Extraer la diagonal de una matriz: diag(Nombre de la matriz), y lo guarda en un vector
%columna
%Meter la diagonal en una matriz: diag(vector) devuleve una matriz con la
%diagonal el vector metido
%H=ones(4)+(diag(v)-diag(ones(4,1))) a una matriz de una le suma la
%diagonal y resta una diagonal de unos para sustituir la diagonal de la
%matriz por otra en vez de sumar
%para crear diagonales no centrales diag(v,1) será la diagonal una por
%encima de la centrada, ya que la centrada sería el cero
%para extraer diagonales no centradas diag(M,1)
%sparse(MAtriz) guarda en una matriz dispersa los numeros distintos de cero
%y sus posiciones en dicha matriz PARA AHORAR ESPACIO
%Inf NaN infinito e indeterminacion o not a number, y se pueden crear
%matrices a partir de ellos
%save para guardar  el workspace desde el command en .m
%save('nombredelarchivo','nombredelavariableaguardar','-formato')
%clear variable borra la x del workspace
%load para cargar workspace guardado
%A=load('MatrizA.txt') y lee la tabla y carga una matriz
%system(copy 'PlantillaPrueba.xlsx A.xlsx')   con system le paso una instruccion
%al sistema operativo en este caso crear una copia de la plantilla de excel
%xlswrite('A.xlsx',Nombredelamatrizovariable,1,'A4') escribir en el excel y a partir de que fila
%y columna. El 1 es la pestaña
%L=xlsread('A.xlsx',1, 'A4:J13') leer en la pesña uno de un excel, se
%podría hacer por nombre de la pestaña. Poner el rango completo a leer
%[num, txt, raw]=xlsread('A.xlsx')
%intervalo y crecimiento x=[-20:0.1:20]
%tic, operaciones, toc para calcular el tiempo que tarda
%./ operaciones elemento a elemento
%ezplot ??
%fplot ???








