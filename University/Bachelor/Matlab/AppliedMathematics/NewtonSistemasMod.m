function [x,niter,hist]=NewtonSistemasMod(fun,x0,h)
    tol2=1e-6;
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
        
        A=hist(:,i)';
        x1=A(1);
        y1=A(2);
        fi=fun(x1,y1);

       
        a=fi;
        b=fun(x1-h,y1);
        c=fun(x1,y1-h);
        sol1=(a(1,:)-b(1,:))/h;
        sol2=(a(1,:)-c(1,:))/h;
        sol3=(a(2,:)-b(2,:))/h;
        sol4=(a(2,:)-c(2,:))/h;
        derfi=[sol1 sol2;sol3 sol4];
        

        hist(:,i+1)=hist(:,i) - (derfi\fi);                
        i=i+1;
        niter=i-1;
        control=(norm(fi)>tol2);
    end
    x=hist(:,end);
end