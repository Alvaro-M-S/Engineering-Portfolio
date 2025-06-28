function [z,niter,hist]=ReglaFalsa(fun,bracket)
tol1=1e-5;
tol2=1e-5;
n=1;
x(n,[1 2])=bracket([1 2]);
while abs(fun(x(n,2)))>=tol2 && abs(x(n,1)-x(n,2))>=tol1
    m=(fun(x(n,2))/(fun(x(n,2))-fun(x(n,1))));
    xnew=x(n,2)-m*(x(n,2)-x(n,1));
    if fun(xnew)*fun(x(n,1))<0
        x(n+1,1)=x(n,1);
        x(n+1,2)=xnew;
    else
        x(n+1,1)=x(n,2);
        x(n+1,2)=xnew;
    end
    n=n+1;
end    
z=x(n,2);
niter=n;
hist=x;
end
