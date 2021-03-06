function [L] = addBase(theta)
% This outputs the L = R * T * T * R matrix for the base joint

% Note: this is the first motor. The output for this motor is the global
% origin, and its axes when theta=0 are the global axes. The transformation
% is just related to the rotation of the motor:
 
L = [cos(theta), -1*sin(theta), 0, 0;
         sin(theta), cos(theta), 0, 0;
         0, 0, 1, 0;
         0, 0, 0, 1];
end