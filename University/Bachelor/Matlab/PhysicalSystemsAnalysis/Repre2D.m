function [algo]=Repre2D(x,y,barras1,barras2,barras3,barras4,barras5,Fijos)
    
    whos 

    figure
    
    plot(x,y,'bo');

    axis equal
    grid on
    xlabel('X (m)')
    ylabel('Y (m)')

    hold on

    [nb1,nada]=size(barras1);  
    [nb2,nada]=size(barras2);
    [nb3,nada]=size(barras3);
    [nb4,nada]=size(barras4);
    [nb5,nada]=size(barras5);
    
    
    for b=1:nb1
        plot( x(barras1(b,:)) , y(barras1(b,:)) ,'g' );
    end
    for b=1:nb2
        plot( x(barras2(b,:)) , y(barras2(b,:)) ,'k' );
    end
    for b=1:nb3
        plot( x(barras3(b,:)) , y(barras3(b,:)) ,'r' );
    end
    for b=1:nb4
        plot( x(barras4(b,:)) , y(barras4(b,:)) ,'m' );
    end
    for b=1:nb5
        plot( x(barras5(b,:)) , y(barras1(b,:)) ,'c' );
    end
    
    
    nn=length(x);
    for n=1:nn
        if sum(Fijos(n,:))>0
            plot(x(n),y(n),'ko');
        end
    end

end