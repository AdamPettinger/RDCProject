function [points] = calcFramePoints(P)
% Calculates the points for drawing joint axes

% P is a 4x4x6 double thats the DH params for each joint

% points is a 3x4xn matrix of points where n = number of joints + EE
% Each column (3 elements) is an x-y-z to plot
% Each '3x4'slice is an origin and 3 endpoints to plot

% Initialize the arrays
s = size(P);
points = zeros(3,4,s(3));

for i=1:6
    points(1:3,1,i) = P(1:3,4,i);
    points(1:3,2,i) = P(1:3,4,i) + 0.075 * P(1:3,1,i);
    points(1:3,3,i) = P(1:3,4,i) + 0.075 * P(1:3,2,i);
    points(1:3,4,i) = P(1:3,4,i) + 0.075 * P(1:3,3,i);
end

end


