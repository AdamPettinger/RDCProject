function [J, Ji] = findJacobian(R)
% Find the generalized jacobian and inverse
% J is a 6x6 which is the jacobian
% J is a 6x6 which is inv(J)

% INPUTS:
% R is a 4x4x6 matrix where each 4x4 slice is the DH for a single joint
J(1:3,1) = cross(R(1:3,3,1), R(1:3,4,6));
J(4:6,1) = R(1:3,3,1);

for i=6:-1:2
    J(1:3, i) = cross((R(1:3,3,i)),(R(1:3,4,6))-(R(1:3,4,i-1)));
    J(4:6, i) = R(1:3,3,i);
end

Ji = inv(J);
end

