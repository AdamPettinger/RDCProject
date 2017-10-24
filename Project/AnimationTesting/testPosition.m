function [P] = testPosition(T, angles, t1,t2,t3,t4,t5,t6)
P = zeros(size(T));

t1 = angles(1);
P(:,:,1) = subs(T(:,:,1));

end

