function [x,niter,hist]=NewtonSistemas(fun,jacob,x0)
    tol1=1e-4;
    tol2=1e-4;
    niterMax=400;
    control=1;
    i=1;
    L=length(x0);
    hist(L,1)=0;
    hist(:,1)=x0;
    niter=0;
    
    while(control)
        
        if (niter>niterMax)  
            sprintf('El método no converge. Seleccione otra x0.')
            return
        end
        
        fi=fun(hist(:,i));
        derfi=jacob(hist(:,i));
%y=3/0
        hist(:,i+1)=hist(:,i) - (derfi\fi);                
        i=i+1;
        niter=i-1;
        control=(norm(hist(:,i)-hist(:,i-1))>tol1 && norm(fi)>tol2);
    end
    x=hist(:,end);
end