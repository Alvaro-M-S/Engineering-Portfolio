function [z,niter,hist]=NewtonEscalar(fun,derfun,x0)
tol1=1e-4;
tol2=1e-4;
n=1;
x(n)=x0;
x(n+1)=x(n)-(fun(x(n))/derfun(x(n)));
while abs(fun(x(n+1)))>=tol2 && abs(x(n+1)-x(n))>=tol1 && n+1<=400
    n=n+1;
    x(n+1)=x(n)-(fun(x(n))/derfun(x(n)));
end  
niter=n+1;
z=x(n+1);
hist=x;
end
