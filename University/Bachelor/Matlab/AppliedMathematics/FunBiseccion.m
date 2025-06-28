biseccion [z,niter, hist] = biseccion(fun,bracket0)

eps=1e-5;
bracket=bracket0;

while length(bracket) > eps
    xk1=length(bracket)/2;
    
    if(fun(xk1)*f(bracket(1)<0))
        bracket=[bracket(1) xk1];
    else
        bracket=[xk1 bracket(2)];
    end 
    
end

end

opciones=optimoptions('fsolve','TolFun',1.0e-10)