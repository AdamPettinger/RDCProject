function [M] = subsMatrix(N, pos, t1, t2, t3, t4, t5, t6)
% Calculates the numeric value of a symbolic matrix at a specific point.

% M is a 6x6 double
% N is a 6x6 sym
% pos is a 1x6 double of actuator angles

if(length(pos) ~= 6)
    return;
end

t1 = pos(1); t2 = pos(2); t3 = pos(3);
t4 = pos(4); t5 = pos(5); t6 = pos(6);

M = double(subs(N));

end

