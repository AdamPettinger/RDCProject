function [L] = addEE(x,y,z)
% This outputs the L = R * T * T * R matrix for the End Effector

% x,y,z are the distance offsets in meters between the end effector and the
% last joint's origin. The EE's axes will be the same as the last joint's
 
L = [1, 0, 0, x;
     0, 1, 0, y;
     0, 0, 1, z;
     0, 0, 0, 1];
end