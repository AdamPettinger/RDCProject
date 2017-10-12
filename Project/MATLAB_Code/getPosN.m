function [P] = getPosN(R, pos, n)
% Find the position of a specific joint
% P is a 4x4 which describes the rotation and translation of it

% INPUTS:
% R is a 4x4x6 matrix where each 4x4 slice is the L matrix for a joint
% pos is a vector of actuator angles
% n is which joint you would like to return (6 is the end effector)

Rot = [cos(pos(1)), -1*sin(pos(1)), 0, 0;
         sin(pos(1)), cos(pos(1)), 0, 0;
         0, 0, 1, 0;
         0, 0, 0, 1];
     
P = Rot * R(:,:,1);

if (n==1)
    return;
end


for i=2:n
    % Caclulate the rotation due do the motor actuation
    Rot = [cos(pos(i)), -1*sin(pos(i)), 0, 0;
         sin(pos(i)), cos(pos(i)), 0, 0;
         0, 0, 1, 0;
         0, 0, 0, 1];
     
    % Multiply Rot * L(i) to finish the DH for this joint. Post-multiply the
    % result by P to update P to include this joint.
    P = P * Rot * R(:,:,i);
end

