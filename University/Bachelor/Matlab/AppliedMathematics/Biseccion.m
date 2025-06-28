function [z,niter,hist]=Biseccion(fun,bracket);
eps=1e-5;
n=1;
x(n,[1 2])=[bracket(1) bracket(2)];
xnew=(x(n,1)+x(n,2))/2;
while (abs((x(n,2)-x(n,1)))>=eps) && (abs(fun(xnew))>=eps)
    if fun(xnew)*fun(x(n,1))<0
        x(n+1,1)=x(n,1);
        x(n+1,2)=xnew;
    else
        x(n+1,1)=xnew;
        x(n+1,2)=x(n,2);
    end
    n=n+1;
    xnew=(x(n,1)+x(n,2))/2;
end
niter=length(x(:,1));
z=xnew;
hist=x;
end
