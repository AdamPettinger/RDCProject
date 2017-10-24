function [P] = getPos(R, pos, t1,t2,t3,t4,t5,t6)
% Find the position of a all joints
% P is a 4x4x6 which describes the rotation and translation of each joint

% INPUTS:
% R is a 4x4x6 matrix where each 4x4 slice is the L matrix for a joint
% pos is a vector of actuator angles
% theta are the sybolic actuator actions

if(length(pos) ~= 6)
    return;
end

t1 = pos(1); t2 = pos(2); t3 = pos(3);
t4 = pos(4); t5 = pos(5); t6 = pos(6);
     
P(:,:,1) = subs(R(:,:,1));
temp = size(R);

for i=2:temp(end)
    % Post-multiply the result by P to update P to include this joint.
    P(:,:,i) = P(:,:,i-1) * subs(R(:,:,i));
    
end

P = double(P);

