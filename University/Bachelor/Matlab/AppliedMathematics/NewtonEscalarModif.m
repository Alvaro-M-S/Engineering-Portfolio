function [z,niter,hist]=NewtonEscalarModif(fun,derfun,bracket) 
tol1=1e-4;
tol2=1e-4;
n=1;
x(n,[1 2])=[bracket(1) bracket(2)];
xnew=(x(n,1)+x(n,2))/2;
hist(n,1)=xnew;
while (abs((x(n,2)-x(n,1)))>=tol1) && (abs(fun(xnew))>=tol2)
    xnew=xnew-(fun(xnew)/derfun(xnew));
    if xnew<x(n,1) || xnew>x(n,2)
        if fun(xnew)*fun(x(n,1))<0
        x(n+1,1)=min(x(n,1),xnew);
        x(n+1,2)=max(x(n,1),xnew);
        else
        x(n+1,1)=min(x(n,2),xnew);
        x(n+1,2)=max(x(n,2),xnew);
        end 
        n=n+1;
        xnew=(x(n,1)+x(n,2))/2;
        hist(n,1)=xnew;
    else
        x(n+1,:)=x(n,:);
        n=n+1;
        hist(n,1)=xnew;
    end
end  
niter=n;
z=xnew;
end
