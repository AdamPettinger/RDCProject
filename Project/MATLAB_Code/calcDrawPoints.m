function [points, color] = calcDrawPoints(P, Rl)
% Calculates the points for drawing lines to represent the robot
% The robot will be drawn as a series of lines
% The first line will be from the first point to the second point, etc

% P is a 4x4x6 double thats the DH params for each joint
% Rl is a 1x6 bool array that decribes links vs brackets

% points is a 3xn matrix of points where n = fn(number of joints)
% color is a 1xm char array where m = n-1. Each char represents a color to
% draw the line as. 'r' for red, 'b' for blue, 'g' for green

% Initialize the arrays (first point is [0,0,0]')
points = zeros(3, 12);
color = strings(1,11);

color(1) = 'g';
points(1:3, 2) = P(1:3,4,1);
pi = 3; ci= 2;

for i=1:5
    if(Rl(i))
        % this link is a tube
        % Get the z axis for this link
        z = P(1:3,3,i);
        % Get the vector for this link
        d = P(1:3,4,i+1) - P(1:3,4,i);
        % Find the projection of the vector onto the z axis
        c = dot(z,d);
        % The intermediate point is on the z-axis, scaled to the projection
        points(:,2*i+1) = points(:,2*i) + z.*c;
        color(2*i) = 'b';
        color(2*i + 1) = 'r';
    else
        % this link is a bracket
        % Get the x axis for this link
        x = P(1:3,1,i);
        % Get the vector for this link
        d = P(1:3,4,i+1) - P(1:3,4,i);
        % Find the projection of the vector onto the z axis
        c = dot(x,d);
        % The intermediate point is on the z-axis, scaled to the projection
        points(:,2*i+1) = points(:,2*i) + x.*c;
        color(2*i) = 'b';
        color(2*i + 1) = 'g';
    end
    
    % The next point will be the next joint's origin
    points(:, 2*i+2) = P(1:3,4,i+1);
end

end

