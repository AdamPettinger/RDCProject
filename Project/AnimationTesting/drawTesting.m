load('toDraw.mat');

a = [0,0,0]';
b0 = [1,1,1]';
c0 = [1,2,4]';

t = 1:15;

b = zeros(3, length(t));
c = zeros(3, length(t));

b(1:3, 1) = b0;
c(1:3, 1) = c0;

for i=2:length(t)
    delta = rand(1,6) - 0.5;
    b(1:3, i) = b(1:3, i-1) + 0.5 .* delta(1:3)';
    c(1:3, i) = c(1:3, i-1) + 0.5 .* delta(4:6)';
end

figure();
subplot(2,2,1)
    grid on; view(3);
    for i=1:length(t)
        pause(0.25);
        hold on;
        plot3([a(1), b(1,i)], [a(2), b(2,i)], [a(3), b(3,i)], 'color', 'red', 'linewidth', 3);
        plot3([b(1,i), c(1,i)], [b(2,i), c(2,i)], [b(3,i), c(3,i)], 'color', 'blue', 'linewidth', 3);
        hold off;
        drawnow;
    end