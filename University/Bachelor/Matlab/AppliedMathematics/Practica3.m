%% Práctica 3. 2020-2021.
%% Datos para el ajuste
xdat =[
-6.7403
-5.2670
-3.2781
-2.5414
-1.5101
-0.3315
0.1842
0.1842
1.2891
1.8785
3.4991
4.2357
5.3775
6.0773
8.4715
];
ydat =[
-0.0029
0.0146
0.5754
1.4398
2.0473
1.7728
1.3989
1.3989
1.3055
1.5216
1.2704
0.7039
0.2599
0.0438
0.0029
];
%%
figure(1)
plot(xdat,ydat,'o')

m=length(xdat);

%%Ajuste familia 1
H1=@(x,alfa) alfa(1)+alfa(2)*x+alfa(3)*x.^2+alfa(4)*x.^3+alfa(5)*x.^4+alfa(6)*x.^5;
A=[ones(m,1) xdat xdat.^2 xdat.^3 xdat.^4 xdat.^5];
alfasol1=A\ydat;
H1sol=@(x) H1(x, alfasol1);
figure(1)
plot(xdat,ydat,'o')
hold on
fplot(H1sol,[-7 9],'color','red');
%
Error1=norm(ydat-A*alfasol1)

%%Ajuste familia 2
H2=@(x,alfa) alfa(1)+alfa(2)*cos(alfa(6)*x)+alfa(3)*sin(alfa(6)*x)+alfa(4)*cos(2*alfa(6)*x)+alfa(5)*sin(2*alfa(6)*x);
F2=@(alfa) ydat-H2(xdat,alfa);
%alfainic=[1 1 1 1 1 1]';
alfainic=[1 1 0.1 4 4 0.5]';
%alfainic=[1 2 0.5 5 6 0.1]';
alfasol2=fsolve(F2,alfainic)
%
H2sol=@(x) H2(x, alfasol2);
figure(2)
plot(xdat,ydat,'o')
hold on
fplot(H2sol,[-7 9],'color','m')
hold off
Error2=norm(ydat-H2sol(xdat))

%%Ajuste familia 3
H3=@(x,alfa) alfa(1)*exp(-((x-alfa(2))/alfa(3)).^2) + alfa(4)*exp(-((x-alfa(5))/alfa(6)).^2);
F3=@(alfa) ydat-H3(xdat,alfa);
%alfainic=[1 1 1 1 1 1]';
%alfainic=[1 1 0.1 4 4 0.5]';
%alfainic=[1 2 0.5 5 6 0.1]';
alfainic=[1 -1 0.1 4 2 0.5]';
alfasol3=fsolve(F3,alfainic)
%
H3sol=@(x) H3(x, alfasol3);
figure(3)
plot(xdat,ydat,'o')
hold on
fplot(H3sol,[-7 9],'color','k')
hold off
Error3=norm(ydat-H3sol(xdat))


exp(4)
