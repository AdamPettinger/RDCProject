function [lines] = drawLines(G, color)
% Draws the lines for a set of points G

% lines is an array of function handles to line. This is returned for
% deleting later

% G is a 3xn matrix of points to draw. Each column is an xyz point
% color is a 1x(n-1) matrix of colors (as chars) to make it pretty

lines = gobjects([1,length(G)-1]);

for i=1:length(color)
    if (color(i) == 'r')
        lines(i) = line([G(1,i), G(1,i+1)], [G(2,i), G(2,i+1)], [G(3,i), G(3,i+1)], 'color', 'red', 'linewidth', 1);
    elseif (color(i) == 'b')
        lines(i) = line([G(1,i), G(1,i+1)], [G(2,i), G(2,i+1)], [G(3,i), G(3,i+1)], 'color', 'blue', 'linewidth', 3);
    elseif (color(i) == 'g')
        lines(i) = line([G(1,i), G(1,i+1)], [G(2,i), G(2,i+1)], [G(3,i), G(3,i+1)], 'color', 'green', 'linewidth', 1);
    else
        lines(i) = line([G(1,i), G(1,i+1)], [G(2,i), G(2,i+1)], [G(3,i), G(3,i+1)], 'color', 'black', 'linewidth', 3);
    end
               
end
end

