function [lines] = drawFrames(G)
% Draws the lines for a set of points G

% lines is an array of function handles to line. This is returned for
% deleting later

% G is a 3x4xn matrix of points to draw. 
% Each column (3 elements) is an x-y-z to plot
% Each '3x4'slice is an origin and 3 endpoints to plot

s = size(G);

lines = gobjects([1,3*s(3)]);

for i=1:s(3)
    % x-axis
    lines(i) = line([G(1,1,i), G(1,2,i)], [G(2,1,i), G(2,2,i)], [G(3,1,i), G(3,2,i)], 'color', 'yellow', 'linewidth', 1);
    lines(i+1) = line([G(1,1,i), G(1,3,i)], [G(2,1,i), G(2,3,i)], [G(3,1,i), G(3,3,i)], 'color', 'cyan', 'linewidth', 1);
    lines(i+2) = line([G(1,1,i), G(1,4,i)], [G(2,1,i), G(2,4,i)], [G(3,1,i), G(3,4,i)], 'color', 'magenta', 'linewidth', 1);
end
end

