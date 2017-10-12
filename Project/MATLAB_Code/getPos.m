function [P] = getPos(R, pos)
% Find the position of a all joints
% P is a 4x4x6 which describes the rotation and translation of each joint

% INPUTS:
% R is a 4x4x6 matrix where each 4x4 slice is the L matrix for a joint
% pos is a vector of actuator angles

P = zeros(size(R));

Rot = [cos(pos(1)), -1*sin(pos(1)), 0, 0;
         sin(pos(1)), cos(pos(1)), 0, 0;
         0, 0, 1, 0;
         0, 0, 0, 1];
     
P(:,:,1) = Rot * R(:,:,1);

for i=2:length(R)
    % Caclulate the rotation due do the motor actuation
    Rot = [cos(pos(i)), -1*sin(pos(i)), 0, 0;
         sin(pos(i)), cos(pos(i)), 0, 0;
         0, 0, 1, 0;
         0, 0, 0, 1];
     
    % Multiply Rot * L(i) to finish the DH for this joint. Post-multiply the
    % result by P to update P to include this joint.
    P(:,:,i) = P(:,:,i-1) * Rot * R(:,:,i);
end

