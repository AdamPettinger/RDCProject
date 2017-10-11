l = 1;
x = [0, 0];
y = [0, 0];
z = [0, 0];

t = 0:0.1:pi;

for i=1:length(t)
    sb1 = subplot(2,2,1);
        grid on;
        axis([-1 1 -1 1]);
        x(2) = cos(t(i));
        y(2) = sin(t(i));
        pl = line(x,y, z);
        view(3);
        
        
    sb2 = subplot(2,2,2);
        copyobj(pl, sb2);
        view([0 0 1]);
        delete(pl);
        
    test = getframe;
    M(i) = test;
    
end

movie(M)