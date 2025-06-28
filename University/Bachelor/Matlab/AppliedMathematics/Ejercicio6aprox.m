% % % Datos para el ajuste
xdat=[0.5:0.5:10]';
%
ydat =[
2.237534125540805e+00
1.690484470063595e+00
1.869362044648552e+00
1.276275254102280e+00
1.149976186564736e+00
8.220058839199051e-01
1.000843340176015e+00
7.435363664972492e-01
9.939046375108151e-01
5.577089747960804e-01
6.195278837177227e-01
5.625846381694255e-01
3.300768977678137e-01
5.561319630322391e-01
3.838204425797536e-01
2.747223873331872e-01
4.415394186682277e-01
2.355553602438584e-01
4.063012721918871e-01
2.819489216693346e-01
];
%%
figure(1)
plot(xdat,ydat,'o')

h=@(x,a) a(1)*x.^a(2).*exp(a(3)*x);

%Ajuste del problema transformado,lineal
m=length(xdat);
A=[ones(m,1) log(xdat) xdat];
bT=A\log(ydat)
%Deshacer betas
asolT(1)=exp(bT(1));
asolT(2)=bT(2);
asolT(3)=bT(3);

hsolT=@(x) h(x,asolT);
ErrorT=norm(ydat-hsolT(xdat))
asolT

figure(2)
plot(xdat,ydat,'o')
hold on
fplot(hsolT,[0.5 10],'color','red')
hold off

F=@(a) ydat-h(xdat,a);

ainic=asolT;
asol=fsolve(F,ainic)
asolT
hsol=@(x) h(x,asol);
Error=norm(ydat-hsol(xdat))
ErrorT

figure(2)
plot(xdat,ydat,'o')
hold on
fplot(hsolT,[0.5 10],'color','red')
fplot(hsol,[0.5 10],'color','blue')
hold off
