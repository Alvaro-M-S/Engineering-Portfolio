% Tema 0 ej 17 metodo 2
% A=[
% 9 3 2 10 5
% -3 -4 -4 -7 -10
% 2 5 9 6 10
% 9 10 21 14 15
% 8 4 7 9 5
% ];
% indxdato=[2 4];
% indbdato=setdiff(1:5,indxdato);
% valxdato=[-1 2]';
% valbdato=[10 20 15]';
% b(indbdato)=valbdato;
% x4(indxdato)=valxdato;
% x=[x4 0];
% for i=1:3
%     e=indbdato(i);
%     for j=1:2
%     f=indxdato(j);
%     b(e)=b(e)-A(e,f)*x(f);
%     end 
% end
% Ap=A;
% Ap(2,:)=zeros(1,5);
% Ap(:,2)=zeros(1,5);
% Ap(2,2)=1;
% Ap(4,:)=zeros(1,5);
% Ap(:,4)=zeros(1,5);
% Ap(4,4)=1;
% b(indxdato(1))=valxdato(1);
% b(indxdato(2))=valxdato(2);
% sol=Ap\b'
% bsol=A*sol

% nudos=[-3/5 0 3/5];
% A=[ones(1,3); nudos; nudos.^2];
% y=[2; integral(@(x) x,-1,1); integral(@(x) x.^2,-1,1)];
% coefs=A\y;
% cambio=@(x) 2*x+4;
% f=@(x) exp(-x.^2);
% nudosc=cambio(nudos);
% sol=2*sum(coefs'.*f(nudosc))


