%Tareas Tema 2 SF

%Tarea 1

% a=3;
% b=1/8;
% c=1/2;
% 
% f=@(x) (1/2-x)+(a*x)/(1+((x-c)/b)^2);
% 
% E=1;
% T=10^(-4)
% 
% a=0;
% b=1;
% 
% while E>T
%     xm=0.5*(a+b);
%     fx=f(xm);
%     fa=f(a);
%     fb=f(b);
%     
%     if fa*fx<0
%         b=xm;
%     else
%         a=xm;
%     end
%     E=abs(fx)
% end
% 
% fx
% 
% xm

%Tarea 2

% a=3;
% b=1/8;
% c=1/2;
% 
% f=@(x) (1/2-x)+(a*x)/(1+((x-c)/b)^2);
% 
% E=1;
% T=10^(-4)
% 
% a=0;
% b=1;
% 
% while E>T
%     xm=0.5*(a+b);
%     fx=f(xm);
%     fa=f(a);
%     fb=f(b);
%     
%     if fa*fx<fa*fb
%         a=xm;
%     else
%         b=xm;
%     end
%     fx2=f(b)
%     E=abs(fx2-fx)
% end
% 
% fx
% 
% xm

%Tarea 3
% 
% A=zeros(15);
% B=ones(5);
% 
% A(1:5,1:5)=A(1:5,1:5)+B;
% A(11:15,1:5)=A(11:15,1:5)+B;
% A(1:5,11:15)=A(1:5,11:15)+B;
% A(11:15,11:15)=A(11:15,11:15)+B;
% A(6:10,6:10)=A(6:10,6:10)+B;
% 
% B=ones(5);
% C=zeros(5);
% Ap=[B C B; C B C; B C B];

% Tarea 4
% 
% A=zeros(7);
% unos=ones(7,1);
% diagunos=diag(unos);
% dos=[2 2 2 2 2 2];
% diagdos1=diag(dos,1);
% diagdos2=diag(dos,-1);
% tres=[3 3 3 3 3];
% diagtres1=diag(tres,2);
% diagtres2=diag(tres,-2);
% A=A+diagunos+diagdos1+diagdos2+diagtres1+diagtres2;

% Tarea 5

% A=[1 0 1 0 2; 0 2 0 0 3; 2 0 3 0 1; 0 0 0 4 0; 4 0 3 0 5];
% b=[14 19 16 16 38];
% b=b';
% x=A\b;
