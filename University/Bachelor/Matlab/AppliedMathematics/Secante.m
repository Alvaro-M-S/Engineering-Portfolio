function [z,niter,hist]=Secante(fun,x0,x1)
tol1=1e-4;
tol2=1e-4;
n=1;
x(n,[1 2])=[x0 x1];
while abs(fun(x(n,2)))>=tol2 && abs(x(n,1)-x(n,2))>=tol1
    m=(fun(x(n,2))/(fun(x(n,2))-fun(x(n,1))));
    x(n+1,1)=x(n,2);
    x(n+1,2)=x(n,2)-m*(x(n,2)-x(n,1));
    n=n+1;
end    
z=x(n,2);
niter=n;
hist=x;
end

